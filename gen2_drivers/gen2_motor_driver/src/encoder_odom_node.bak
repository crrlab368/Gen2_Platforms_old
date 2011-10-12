#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include "gen2_motor_driver/pid_plot.h"


double x = 0.0;
double y = 0.0;
double th = 0.0;

double wheel_base = 0;
double encoder_scale_correction = 1.035677;

ros::Time current_time, last_time;
ros::Publisher odom_pub;

//geometry_msgs::TransformStamped odom_trans;


void velocityCallback(const gen2_motor_driver::pid_plot &pid_plot)
{
	
	//Calculate the time between messages for the wheel velocity function.
	last_time = current_time;
	current_time = ros::Time::now();
	
	double vx = ((pid_plot.left_vel/100)+(pid_plot.right_vel/100))/2;
	double vy = 0;
  	double vth = ((pid_plot.right_vel/100)-(pid_plot.left_vel/100))/(wheel_base/100);

	//compute odometry in a typical way given the velocities of the robot
	double dt = (current_time - last_time).toSec();
	double delta_x = (vx * cos(th) - vy * sin(th)) * dt;
    	double delta_y = (vx * sin(th) + vy * cos(th)) * dt;
    	double delta_th = vth * dt;

    	x += delta_x;
    	y += delta_y;
    	th += (delta_th * encoder_scale_correction);

	//since all odometry is 6DOF we'll need a quaternion created from yaw
    	geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(th);

    	//first, we'll publish the transform over tf
    	/*odom_trans.header.stamp = current_time;
    	odom_trans.header.frame_id = "odom";
    	odom_trans.child_frame_id = "base_footprint";

    	odom_trans.transform.translation.x = x;
    	odom_trans.transform.translation.y = y;
    	odom_trans.transform.translation.z = 0.0;
    	odom_trans.transform.rotation = odom_quat;*/

    	

    	//next, we'll publish the odometry message over ROS
    	nav_msgs::Odometry odom;
    	odom.header.stamp = current_time;
    	odom.header.frame_id = "odom";

    	//set the position
    	odom.pose.pose.position.x = x;
    	odom.pose.pose.position.y = y;
    	odom.pose.pose.position.z = 0.0;
    	odom.pose.pose.orientation = odom_quat;

	boost::array<double, 36> covariance = {1e-09, 0.0, 0.0, 0.0, 0.0, 0.0,
			       0.0, 0.001, 1e-09, 0.0, 0.0, 0.0,
			       0.0, 0.0, 1e6, 0.0, 0.0, 0.0,
			       0.0, 0.0, 0.0, 1e6, 0.0, 0.0,
 			       0.0, 0.0, 0.0, 0.0, 1e6, 0.0,
			       0.0, 0.0, 0.0, 0.0, 0.0, 1e-09};

	odom.pose.covariance = covariance;
	odom.twist.covariance = covariance;
    	//set the velocity
    	odom.child_frame_id = "base_footprint";
    	odom.twist.twist.linear.x = vx;
    	odom.twist.twist.linear.y = vy;
    	odom.twist.twist.angular.z = vth;

    	//publish the message
    	odom_pub.publish(odom);
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "encoder_odom_node");

  
  ros::NodeHandle n;
  odom_pub = n.advertise<nav_msgs::Odometry>("odom", 50);

  //tf::TransformBroadcaster odom_broadcaster;

  //send the transform
  
  

  ros::Subscriber sub_pid_plot = n.subscribe("pid_plot", 10, velocityCallback);

  	while(n.ok())
	{	
		//odom_broadcaster.sendTransform(odom_trans);
		n.param("mot_con_node/wheel_base", wheel_base, 36.25);
		ros::spinOnce();	
  	}
}
