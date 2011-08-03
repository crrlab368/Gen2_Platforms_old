#ifndef ros_pid_plot_h
#define ros_pid_plot_h

#include "WProgram.h"
#include "ros.h"

namespace gen2_motor_driver
{

  class pid_plot : public ros::Msg
  {
    public:
      float left_vel;
      float right_vel;

    virtual int serialize(unsigned char *outbuffer)
    {
      int offset = 0;
      union {
        float real;
        unsigned long base;
      } u_left_vel;
      u_left_vel.real = this->left_vel;
      *(outbuffer + offset + 0) = (u_left_vel.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_left_vel.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_left_vel.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_left_vel.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->left_vel);
      union {
        float real;
        unsigned long base;
      } u_right_vel;
      u_right_vel.real = this->right_vel;
      *(outbuffer + offset + 0) = (u_right_vel.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_right_vel.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_right_vel.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_right_vel.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->right_vel);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      union {
        float real;
        unsigned long base;
      } u_left_vel;
      u_left_vel.base = 0;
      u_left_vel.base |= ((typeof(u_left_vel.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      u_left_vel.base |= ((typeof(u_left_vel.base)) (*(inbuffer + offset + 1))) << (8 * 1);
      u_left_vel.base |= ((typeof(u_left_vel.base)) (*(inbuffer + offset + 2))) << (8 * 2);
      u_left_vel.base |= ((typeof(u_left_vel.base)) (*(inbuffer + offset + 3))) << (8 * 3);
      this->left_vel = u_left_vel.real;
      offset += sizeof(this->left_vel);
      union {
        float real;
        unsigned long base;
      } u_right_vel;
      u_right_vel.base = 0;
      u_right_vel.base |= ((typeof(u_right_vel.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      u_right_vel.base |= ((typeof(u_right_vel.base)) (*(inbuffer + offset + 1))) << (8 * 1);
      u_right_vel.base |= ((typeof(u_right_vel.base)) (*(inbuffer + offset + 2))) << (8 * 2);
      u_right_vel.base |= ((typeof(u_right_vel.base)) (*(inbuffer + offset + 3))) << (8 * 3);
      this->right_vel = u_right_vel.real;
      offset += sizeof(this->right_vel);
     return offset;
    }

    const char * getType(){ return "gen2_motor_driver/pid_plot"; };

  };

}
#endif