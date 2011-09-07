/*************************************************************
*Project: mot_con_node.cpp
*Author(s): Brian Pappas, Jarred Beck
*Date: 7/20/11
*Description: ROS node for handling drive commands from NAV 
*stack.  Takes in encoder_gyro and twist messages and publishes
*drive_msg messages to allow for precise control of a gen2 
*platform's movements.
*************************************************************/
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "gen2_motor_driver/drive_msg.h"
#include "gen2_motor_driver/encoder_gyro.h"
#include "gen2_motor_driver/pid_plot.h"
#include "geometry_msgs/Twist.h"
#include "math.h"

// Variables for the encoder and velocity calculations.
double right_enc = 0, left_enc = 0;
int prev_r_enc = 0, prev_l_enc = 0;
double r_vel = 0, l_vel = 0;
double dist_r = 0, dist_l = 0;
double last_time = 0, current_time = 0, delta_time = 0;

//Global target velocities.
double vel_goal_l = 0;
double vel_goal_r = 0;
bool right_direction = true;
bool left_direction = true;

//Control gain variables (default values set in main).
double p_gain_l = 0;
double i_gain_l = 0.01;
double d_gain_l = 0;
double p_gain_r = 0;
double i_gain_r = 0.01;
double d_gain_r = 0;

//Control limit variables in PID.
const double i_min = -2550;
const double i_max = 2550;
const int pwm_min = 0;
const int pwm_max = 255; 

//State variables for PID control loop.
double pTerm_l = 0;
double iTerm_l = 0;
double dTerm_l = 0;
double pTerm_r = 0;
double iTerm_r = 0;
double dTerm_r = 0;

double iState_l = 0;
double iState_r = 0;

double dState_l = 0;
double dState_r = 0;

//Pwm variables for message.
int pwm_l = 0;
int pwm_r = 0;

//Wheel Diameter
double right_circum = 0;
double left_circum = 0;
double wheel_base = 0;
const int enc_per_rev = 2031;


//Declaration of publisher for drive_msg and pid_plot.
ros::Publisher drive_pub;
ros::Publisher pid_plot_pub;


//Global function for calculating the current wheel velocity
double wheel_velocity(int cur_enc, int prev_enc, double d_time, double wheel_circum)
{
	  //Calculate the number of encoder counts since the last message.
	  short int diff_enc = cur_enc-prev_enc;
	  //Return the velocity in cm/s.  
	  //Equation is # of counts * distance traveled per count * time adjustment to seconds.
	  //Current publishing rate from Arduino is 100Hz or once every 10mS. Multiplication is to 
	  //adjust to cm/seconds. Wheel Circum is in cm. Resulting Velocity is cm/s
	  return diff_enc*(wheel_circum/enc_per_rev)/d_time;
}


void velocityCallback(const geometry_msgs::Twist &msg_vel_in)
{
	//Get linear and angualr velocity from Twist message.
	double x = msg_vel_in.linear.x;
	double z = msg_vel_in.angular.z;
	vel_goal_l = (100*x-((z*wheel_base)/2));  //multiply by 100 to translate into cm/s from m/s
	vel_goal_r = (100*x+((z*wheel_base)/2));
}


/*Function called when new encoder_gyro message arrives. This will check the current target 
 velocity defined in the global variables vel_goal_l and vel_goal_r then compare to the current
 velocity it calculates from the encoder data.  It then will make adjustments to the current pwm 
 outputs sent back to the Arduino board to control the motor driver. 
*/
void encoderCallback(const gen2_motor_driver::encoder_gyro &msg_in)
{
	left_direction = true;
	right_direction = true;

	//Pid only is aware of PWM values.  All velocities must be positive.
	//Direction flags are used to keep track of motro direction.
	if (vel_goal_l < 0)
	{
		vel_goal_l = -vel_goal_l;
		left_direction = false;
	}
	if (vel_goal_r < 0)
	{
		vel_goal_r = -vel_goal_r;
		right_direction = false;
	}


	right_enc = msg_in.right_count;
	left_enc = msg_in.left_count;

	//Calculate the time between messages for the wheel velocity function.
	last_time = current_time;
	current_time = msg_in.header.stamp.toSec();
	delta_time = (current_time - last_time);

	//Calculates the current velocity of each wheel.
	r_vel = wheel_velocity(msg_in.right_count,prev_r_enc, delta_time, right_circum);
	l_vel = wheel_velocity(msg_in.left_count,prev_l_enc, delta_time, left_circum);

	//Packs pid_plot message for publishing.
	gen2_motor_driver::pid_plot plot_out;
	plot_out.left_vel = l_vel;
	plot_out.right_vel = r_vel;
	plot_out.gyro_val = msg_in.gyro_val;
	plot_out.header.stamp = msg_in.header.stamp;

	//Publishes pid_plot message.
	pid_plot_pub.publish(plot_out);

	//Calculates current distance traveled by each wheel. 
	dist_l+=(l_vel/100)*delta_time;
	dist_r+=(r_vel/100)*delta_time;

	if(left_direction == false)
	{
		l_vel = -l_vel;
	}
	if(right_direction == false) 
	{
		r_vel = -r_vel;
	}

	//Stores the current encoder counts for future reference in next cycle.
	prev_r_enc = msg_in.right_count;
	prev_l_enc = msg_in.left_count;

	



	//Prints the velocities and distance traveled for testing. 
	//ROS_INFO("\nRight Vel = %f\nLeft Vel = %f\nRight Dist: %f/nLeft Dist: %f",r_vel, l_vel,dist_r, dist_l);

	//Important part.

	//Control loop for left wheel.
	double l_diff = vel_goal_l - l_vel;
	 
	//Remember error state. 
	iState_l += l_diff;


	//Calculate p term.
	pTerm_l = (l_diff * p_gain_l);

	//Check if error state has exceeded the max or min level.
	if(iState_l > i_max) 
	{
		iState_l = i_max;
	}
	else if(iState_l < i_min)
	{
		iState_l = i_min;
	}

	//Calculate i term.
	iTerm_l = (i_gain_l * iState_l);

	//Calculate d term.
	dTerm_l = d_gain_l * (dState_l - l_vel);
	dState_l = l_vel;

   	pwm_l = (int)(pTerm_l + iTerm_l + dTerm_l);

 	//Control loop for right wheel.
	double r_diff = vel_goal_r - r_vel;
 
	//Remember error state. 
	iState_r += r_diff;


	//Calculate p term.
	pTerm_r = (r_diff * p_gain_r);

	//Check if error state has exceeded the max or min level.
	if(iState_r > i_max) 
	{
	  iState_r = i_max;
	}
	else if(iState_r < i_min)
	{
	  iState_r = i_min;
	}

	//Calculate i term.
	iTerm_r = (i_gain_r * iState_r);

	//Calculate d term.
	dTerm_r = d_gain_r * (dState_r - r_vel);
	dState_r = r_vel;

   	pwm_r = (int)(pTerm_r + iTerm_r + dTerm_r);



	//Ensure control correction is in acceptable pwm range
	if(pwm_r > pwm_max)
	{
		pwm_r = pwm_max;
	}
	else if(pwm_r < pwm_min)
	{
		pwm_r = pwm_min;
	}

	if(pwm_l > pwm_max)
	{
		pwm_l = pwm_max;
	}
	else if(pwm_l < pwm_min)
	{
		pwm_l = pwm_min;
	}

	//Stop motors if the velocity goal is 0
	if(vel_goal_l == 0)
	{
		pwm_l = 0;
	}
	if(vel_goal_r == 0)
	{
		pwm_r = 0;
	}
 
	ROS_INFO("\nRight Encodder: %d\nLeft Encoder: %d\nRight Vel: %f\nRight Goal: %f\nLeft Vel: %f\nLeft Goal: %f\nRight Dist: %f\nLeft Dist: %f\nR_diff: %f\nL_diff:%f\nR_PWM: %d\nL_PWM: %d\nDelta_time: %f", msg_in.right_count,msg_in.left_count,r_vel,vel_goal_r,l_vel,vel_goal_l,dist_r,dist_l,r_diff,l_diff,pwm_r, pwm_l, delta_time);

	//Creates message to be packed for sending to the Arduino.
	gen2_motor_driver::drive_msg msg_out;

	//Pwm percentages sent to Arduino
	msg_out.left_pwm = pwm_l;
	msg_out.right_pwm = pwm_r;

	//Motor direction to be sent to Arduino.
	msg_out.left_dir = left_direction;
	msg_out.right_dir = right_direction;


	if(left_direction == false)
	{
		vel_goal_l = -vel_goal_l;
	}

	if(right_direction == false)
	{
		vel_goal_r = -vel_goal_r;
	}


	//Publishes the message. 
 	drive_pub.publish(msg_out);
}

//Main start.
int main(int argc, char **argv)
{
	//Initialization function ROS requires that sets the name for the node.
	ros::init(argc, argv, "mot_con_node");
  
	//Creates the node handle for communication on ROS network.
  	ros::NodeHandle n;
  
	//Initialize the publisher for drive_msg and pid_plot.
	drive_pub = n.advertise<gen2_motor_driver::drive_msg>("drive_msg", 1000);
  	pid_plot_pub = n.advertise<gen2_motor_driver::pid_plot>("pid_plot", 1000);
  
  	//Initialize the subscriber for encoder_gyro messages. 
  	ros::Subscriber sub = n.subscribe("encoder_gyro", 1000, encoderCallback);

  	//Initialize the subscriber for cmd vel (angular and linear velocity messages)
  	ros::Subscriber sub_vel = n.subscribe("cmd_vel", 10, velocityCallback);
 
  	//While ros has not been shutdown or the node has not been kicked off the network or shutdown, continue this loop
  	while(ros::ok())
 	{
		//Get current right motor pid gains from Parameter Server
		n.param("mot_con_node/right_p", p_gain_r, 6.0);
		n.param("mot_con_node/right_i", i_gain_r, 0.5);
	 	n.param("mot_con_node/right_d", d_gain_r, 0.0);

		//Get current left motor pid gains from Parameter Server
		n.param("mot_con_node/left_p", p_gain_l, 6.0);
		n.param("mot_con_node/left_i", i_gain_l, 0.5);
		n.param("mot_con_node/left_d", d_gain_l, 0.0);

		//Get main left and righ wheel diameter from Parameter Server
		n.param("mot_con_node/r_circum", right_circum, 47.0);
		n.param("mot_con_node/l_circum", left_circum, 47.0);

		//Get wheel base diameter from Parameter Server
		n.param("mot_con_node/wheel_base", wheel_base, 36.25);

		//Spin the ROS nodehandle.
		ros::spinOnce();
 	}
  
	//End of main loop.
	return 0;
}

