#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "vector"

const int arr_length = 30;
double avg_vel_arr_lin [arr_length] = {0};
double avg_vel_arr_ang [arr_length] = {0};
double avg_vel_lin = 0;
double avg_vel_ang = 0;


double wheel_base = 0;

ros::Publisher vel_pub;



void velocityCallback(const geometry_msgs::Twist &msg_vel_in)
{
	double x = msg_vel_in.linear.x;
	double z = msg_vel_in.angular.z;

	for (int i=0;i<arr_length-1;i++)
	{
		avg_vel_arr_lin[i]=avg_vel_arr_lin[i+1];
		avg_vel_arr_ang[i]=avg_vel_arr_ang[i+1];
	}
	avg_vel_arr_lin[arr_length-1] = x;
	avg_vel_arr_ang[arr_length-1] = z;

	
	double sum_r = 0;
	double sum_l = 0;
	for (int i=0;i<=arr_length-1;i++)
	{
		sum_r+=avg_vel_arr_lin[i];
		sum_l+=avg_vel_arr_ang[i];
	}

	avg_vel_lin = sum_r/arr_length;
	avg_vel_ang = sum_l/arr_length;
	
	geometry_msgs::Twist smooth_out;
	smooth_out.linear.x = avg_vel_lin;
	smooth_out.angular.z = avg_vel_ang;
	vel_pub.publish(smooth_out);
	
	
}

//Main start.
int main(int argc, char **argv)
{

	//Initialization function ROS requires that sets the name for the node.
	ros::init(argc, argv, "velocity_smoother_node");

	//Creates the node handle for communication on ROS network.
  	ros::NodeHandle n;

	//Initialize the publisher for drive_msg and pid_plot.
	vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel_smoother", 1000);

	//Initialize the subscriber for cmd vel (angular and linear velocity messages)
  	ros::Subscriber sub_vel = n.subscribe("cmd_vel", 10, velocityCallback);

	//While ros has not been shutdown or the node has not been kicked off the network or shutdown, continue this loop
  	while(ros::ok())
 	{
		//Get wheel base diameter from Parameter Server
		n.param("mot_con_node/wheel_base", wheel_base, 36.25);

		//Spin the ROS nodehandle.
		ros::spinOnce();
 	}
	return 0;
}
