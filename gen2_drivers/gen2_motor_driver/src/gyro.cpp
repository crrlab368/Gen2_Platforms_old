/*************************************************************
*Project: gyro.cpp
*Author(s): Brian Pappas, Jarred Beck
*Date: 7/21/11
*Description: ROS node for handling the translation of the 
*raw gyro data being published in encoder_gyro.msg
*************************************************************/
#include "ros/ros.h"
#include "gen2_motor_driver/encoder_gyro.h"
#include "sensor_msgs/Imu.h"
#include "geometry_msgs/Twist.h"
#include "math.h"
#include "gen2_motor_driver/pid_plot.h"
#include "vector"
#include "time.h"
#include "kdl/frames.hpp"

using namespace std;

ros::Publisher imu_pub;
ros::Time last_time_global;


class Gen2Gyro 
{
public:
Gen2Gyro();
double cal_offset;
double orientation;
vector<double> cal_buffer;
double cal_buffer_length;
sensor_msgs::Imu imu_data;
sensor_msgs::Imu imu_raw;
double gyro_scale_correction;
ros::Time last_time;

void update_cal(gen2_motor_driver::pid_plot vel_msg);
void publish(gen2_motor_driver::pid_plot gyro_msg);

} main_gyro;




Gen2Gyro::Gen2Gyro()
	{
	
	cal_offset = 0.0;
	orientation = 0.0;
	cal_buffer_length = 1000;
	imu_data.header.frame_id = "gyro_link";

	boost::array<double, 9> temp1 = {{1e6, 0, 0, 0, 1e6, 0, 0, 0, 1e-6}};
	imu_data.orientation_covariance = temp1;
	boost::array<double, 9> temp2 = {{1e6, 0, 0, 0, 1e6, 0, 0, 0, 1e-6}};
	imu_data.angular_velocity_covariance = temp2;
	boost::array<double,9> temp3 = {{-1,0,0,0,0,0,0,0,0}};
	imu_data.linear_acceleration_covariance = temp3;
	gyro_scale_correction = 1.35;
	
	}

 void Gen2Gyro::update_cal(gen2_motor_driver::pid_plot vel_msg) 

{
 if(vel_msg.left_vel == 0.0 && vel_msg.right_vel == 0.0) 
  {	
	int sum = 0;

	cal_buffer.push_back(vel_msg.gyro_val);

	if(cal_buffer.size() > cal_buffer_length)
	{

	  cal_buffer.erase(cal_buffer.begin());

	}
	for(int i = 0; i < cal_buffer.size(); i++)
	{
		sum+= cal_buffer[i];
	}

	cal_offset = (sum / cal_buffer.size());

  }

}

void gyroCallback(const gen2_motor_driver::pid_plot &msg_in)
{
	main_gyro.update_cal(msg_in);
	main_gyro.publish(msg_in); 
}



 void Gen2Gyro::publish(gen2_motor_driver::pid_plot gyro_msg)
  {
	if(cal_offset == 0)
	{
	return;
	}

	ros::Time current_time = gyro_msg.header.stamp;
	double dt = (current_time - last_time).toSec();
	double past_orientation = orientation;
	imu_data.header.stamp = gyro_msg.header.stamp;
	imu_data.angular_velocity.z = (float(gyro_msg.gyro_val) - cal_offset) / (cal_offset * 150.0 * (M_PI/180) * gyro_scale_correction);
	
	//sign change for z angular
	imu_data.angular_velocity.z = -imu_data.angular_velocity.z;
	orientation += imu_data.angular_velocity.z * dt;
	KDL::Rotation rotation;
	rotation.RotZ(orientation);
	KDL::Vector tempVec = rotation.GetRot();
	imu_data.orientation.z = tempVec.data[2];
	rotation.GetQuaternion(imu_data.orientation.x, imu_data.orientation.y, imu_data.orientation.z, imu_data.orientation.w); 
	
	//Publish data
	imu_pub.publish(imu_data);
  }




int main(int argc, char **argv)
{
   ros::init(argc, argv, "gyro_node");

   ros::NodeHandle n;

   ros::Subscriber sub = n.subscribe("pid_plot", 1000, gyroCallback);
   imu_pub = n.advertise<sensor_msgs::Imu>("imu_data", 1000);
   last_time_global = ros::Time::now();
   main_gyro.last_time = last_time_global;
   ros::spin();

 return 0;
}
