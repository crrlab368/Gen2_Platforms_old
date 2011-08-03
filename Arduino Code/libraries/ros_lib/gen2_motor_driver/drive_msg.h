#ifndef ros_drive_msg_h
#define ros_drive_msg_h

#include "WProgram.h"
#include "ros.h"

namespace gen2_motor_driver
{

  class drive_msg : public ros::Msg
  {
    public:
      signed char left_pwm;
      signed char right_pwm;
      bool left_dir;
      bool right_dir;

    virtual int serialize(unsigned char *outbuffer)
    {
      int offset = 0;
      union {
        signed char real;
        unsigned char base;
      } u_left_pwm;
      u_left_pwm.real = this->left_pwm;
      *(outbuffer + offset + 0) = (u_left_pwm.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->left_pwm);
      union {
        signed char real;
        unsigned char base;
      } u_right_pwm;
      u_right_pwm.real = this->right_pwm;
      *(outbuffer + offset + 0) = (u_right_pwm.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->right_pwm);
      union {
        bool real;
        unsigned char base;
      } u_left_dir;
      u_left_dir.real = this->left_dir;
      *(outbuffer + offset + 0) = (u_left_dir.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->left_dir);
      union {
        bool real;
        unsigned char base;
      } u_right_dir;
      u_right_dir.real = this->right_dir;
      *(outbuffer + offset + 0) = (u_right_dir.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->right_dir);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        signed char real;
        unsigned char base;
      } u_left_pwm;
      u_left_pwm.base = 0;
      u_left_pwm.base |= ((typeof(u_left_pwm.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      this->left_pwm = u_left_pwm.real;
      offset += sizeof(this->left_pwm);
      union {
        signed char real;
        unsigned char base;
      } u_right_pwm;
      u_right_pwm.base = 0;
      u_right_pwm.base |= ((typeof(u_right_pwm.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      this->right_pwm = u_right_pwm.real;
      offset += sizeof(this->right_pwm);
      union {
        bool real;
        unsigned char base;
      } u_left_dir;
      u_left_dir.base = 0;
      u_left_dir.base |= ((typeof(u_left_dir.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      this->left_dir = u_left_dir.real;
      offset += sizeof(this->left_dir);
      union {
        bool real;
        unsigned char base;
      } u_right_dir;
      u_right_dir.base = 0;
      u_right_dir.base |= ((typeof(u_right_dir.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      this->right_dir = u_right_dir.real;
      offset += sizeof(this->right_dir);
     return offset;
    }

    const char * getType(){ return "gen2_motor_driver/drive_msg"; };

  };

}
#endif