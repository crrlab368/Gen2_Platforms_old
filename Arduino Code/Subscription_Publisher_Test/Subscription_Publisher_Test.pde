//Include Statements--------------------------------------------------------------------------------------------
//General arduino include statements
#include <math.h>
#include <Wire.h>

//ROS specific include statements
#include <ros.h>
#include <ros/time.h>
#include <gen2_motor_driver/drive_msg.h>
#include <gen2_motor_driver/encoder_gyro.h>
//--------------------------------------------------------------------------------------------------------------

 /*Motor Control
-- Simultaneous Comands to operate both motors in unison
-- Individual Commands to operate right and left motor on their own*/


/* Encoder Handling
 -- Forward And Backwards Count for Left and Right Encoder
 -- Records Distance Wheel has traveled
 -- Function to return total distance and change in distance based on previous request*/
 


long interval = 10;
long previousMillis = 0;
 
//Constants and Class Definitions-------------------------------------------------------------------------------
const int gyro_pin = 8;

//Define Pin Connections for motor controller
const int motorLeft_Enable = 2;
const int motorLeft_I1 = 25;
const int motorLeft_I2 = 24;
const int motorRight_Enable = 3;
const int motorRight_I1 = 29;
const int motorRight_I2 = 28;

//Motor class definition
class Motor
  {
  
  public:
    Motor(int right_enable, int right_I1, int right_I2, int left_enable, int left_I1, int left_I2);
    void forward();
    void right_forward();
    void left_forward();
    void backward();
    void right_backward();
    void left_backward();
    void mspeed(int percent);
    void right_mspeed(int percent);
    void left_mspeed(int percent);
    void mstop();
    void right_mstop();
    void left_mstop();
  
  private:
    int _rightEnablePin;
    int _rightI1pin;
    int _rightI2pin;
    int _rightPercent;
    int _rightpwm;
    int _leftEnablePin;
    int _leftI1pin;
    int _leftI2pin;
    int _leftPercent;
    int _leftpwm;
  };

//Define Pin Connection for Encoders.
const int encoderLeft_CH1 = 19; //<-left motor interrupt
const int encoderLeft_CH2 = 22; //<-left motor direction
const int encoderRight_CH1 = 18;//<-right motor interrupt
const int encoderRight_CH2 = 23;//<-right motor direction   

//Encoder class defintion.
class Encoder
  {
  public:
    Encoder(int ch1Pin, int ch2Pin);
    void count();
    int totaldistance();
    int deltadistance();
  
  private:
    int _ch1Pin;
    int _ch2Pin;
    unsigned int _odometer;
    int _oldodom;
    int _delta;
  };
//--------------------------------------------------------------------------------------------------------------





//Initialize Motor and Encoder Objects.
Motor m(motorRight_Enable, motorRight_I1, motorRight_I2,motorLeft_Enable, motorLeft_I1, motorLeft_I2);
Encoder eright(encoderRight_CH1, encoderRight_CH2);
Encoder eleft(encoderLeft_CH1, encoderLeft_CH2);

//Start ROS subscription code.
ros::NodeHandle nh;

ROS_CALLBACK(messageCb,gen2_motor_driver::drive_msg, drive_msg)
 
 int left_pwm = drive_msg.left_pwm;
 int right_pwm = drive_msg.right_pwm;
 bool left_dir = drive_msg.left_dir;
 bool right_dir = drive_msg.right_dir;
 
 //Stop Movement Case.
 if(left_pwm == 0 && right_pwm == 0)
 {
  m.mstop(); 
 }
 
 //Drive Forward Case.
 else if( left_dir == true && right_dir == true) 
 {
  m.left_mspeed(left_pwm);
  m.right_mspeed(right_pwm);
  m.forward(); 
   
 } 
 
 // Drive Reverse Case.
 else if( left_dir == false && right_dir == false)
 {
  m.left_mspeed(left_pwm);
  m.right_mspeed(right_pwm);
  m.backward(); 
 } 
 
 //Rotate Right Case.
 else if (left_dir == true && right_dir == false) 
 {
  m.left_mspeed(left_pwm);
  m.right_mspeed(right_pwm);
  m.left_forward();  
  m.right_backward();
 } 
 
 // Rotate Left Case.
  else if (left_dir == false && right_dir == true) 
 {
  m.left_mspeed(left_pwm);
  m.right_mspeed(right_pwm);
  m.left_backward();  
  m.right_forward();
 }
 
}

ros::Subscriber sub("drive_msg", &drive_msg, messageCb );

// ROS publisher code
gen2_motor_driver::encoder_gyro encoder_gyro_msg;
ros::Publisher encoder_gyro("encoder_gyro", &encoder_gyro_msg);



void setup()
{
  // Interrupt Initialization for Encoder Counting
  attachInterrupt(5, countright, RISING);
  attachInterrupt(4, countleft, FALLING);
 
  //Start serial interface
  Serial.begin(115200);
  
  
  //Setup ROS subscription service
  nh.initNode();
  nh.subscribe(sub);
  nh.advertise(encoder_gyro);
  
  
}

void loop()
{
  
  //direction_test();
  //encoder_test();
  
  //set values to encoder_gyro message
  encoder_gyro_msg.header.stamp = ros::Time::now();
  encoder_gyro_msg.gyro_val = analogRead(gyro_pin);
  encoder_gyro_msg.right_count = eright.totaldistance();
  encoder_gyro_msg.left_count = eleft.totaldistance();
  
  //Publish
  unsigned long currentMillis = millis();
  if(currentMillis-previousMillis > interval)
  {
    previousMillis = currentMillis;
    encoder_gyro.publish(&encoder_gyro_msg);
  }
  
  
  //Look for new message
   nh.spinOnce();
   
}

void countright()
{
  eright.count();
}

void countleft()
{
  eleft.count();
}






// Test functions
void direction_test(void)
{
  
 m.left_mspeed(26);
 m.right_mspeed(38);
 m.forward();
delay(2000);
m.backward();
delay(2000);
m.left_forward();
delay(2000);
m.left_backward();
delay(2000);
m.right_forward();
delay(2000);
m.right_backward();
delay(2000);
m.mstop();
delay(5000);
  
}

void encoder_test(void)
{
  Serial.print("Right Odom: ");
  Serial.println(eright.totaldistance());
  Serial.print("Left Odom: ");
  Serial.println(eleft.totaldistance());
}




