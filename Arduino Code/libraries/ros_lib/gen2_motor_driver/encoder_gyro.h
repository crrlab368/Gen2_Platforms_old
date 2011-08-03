#ifndef ros_encoder_gyro_h
#define ros_encoder_gyro_h

#include "WProgram.h"
#include "ros.h"
#include "std_msgs/Header.h"

namespace gen2_motor_driver
{

  class encoder_gyro : public ros::Msg
  {
    public:
      std_msgs::Header header;
      long right_count;
      long left_count;
      long gyro_val;

    virtual int serialize(unsigned char *outbuffer)
    {
      int offset = 0;
      offset += this->header.serialize(outbuffer + offset);
      union {
        long real;
        unsigned long base;
      } u_right_count;
      u_right_count.real = this->right_count;
      *(outbuffer + offset + 0) = (u_right_count.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_right_count.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_right_count.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_right_count.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->right_count);
      union {
        long real;
        unsigned long base;
      } u_left_count;
      u_left_count.real = this->left_count;
      *(outbuffer + offset + 0) = (u_left_count.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_left_count.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_left_count.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_left_count.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->left_count);
      union {
        long real;
        unsigned long base;
      } u_gyro_val;
      u_gyro_val.real = this->gyro_val;
      *(outbuffer + offset + 0) = (u_gyro_val.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_gyro_val.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_gyro_val.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_gyro_val.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->gyro_val);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      offset += this->header.deserialize(inbuffer + offset);
      union {
        long real;
        unsigned long base;
      } u_right_count;
      u_right_count.base = 0;
      u_right_count.base |= ((typeof(u_right_count.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      u_right_count.base |= ((typeof(u_right_count.base)) (*(inbuffer + offset + 1))) << (8 * 1);
      u_right_count.base |= ((typeof(u_right_count.base)) (*(inbuffer + offset + 2))) << (8 * 2);
      u_right_count.base |= ((typeof(u_right_count.base)) (*(inbuffer + offset + 3))) << (8 * 3);
      this->right_count = u_right_count.real;
      offset += sizeof(this->right_count);
      union {
        long real;
        unsigned long base;
      } u_left_count;
      u_left_count.base = 0;
      u_left_count.base |= ((typeof(u_left_count.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      u_left_count.base |= ((typeof(u_left_count.base)) (*(inbuffer + offset + 1))) << (8 * 1);
      u_left_count.base |= ((typeof(u_left_count.base)) (*(inbuffer + offset + 2))) << (8 * 2);
      u_left_count.base |= ((typeof(u_left_count.base)) (*(inbuffer + offset + 3))) << (8 * 3);
      this->left_count = u_left_count.real;
      offset += sizeof(this->left_count);
      union {
        long real;
        unsigned long base;
      } u_gyro_val;
      u_gyro_val.base = 0;
      u_gyro_val.base |= ((typeof(u_gyro_val.base)) (*(inbuffer + offset + 0))) << (8 * 0);
      u_gyro_val.base |= ((typeof(u_gyro_val.base)) (*(inbuffer + offset + 1))) << (8 * 1);
      u_gyro_val.base |= ((typeof(u_gyro_val.base)) (*(inbuffer + offset + 2))) << (8 * 2);
      u_gyro_val.base |= ((typeof(u_gyro_val.base)) (*(inbuffer + offset + 3))) << (8 * 3);
      this->gyro_val = u_gyro_val.real;
      offset += sizeof(this->gyro_val);
     return offset;
    }

    const char * getType(){ return "gen2_motor_driver/encoder_gyro"; };

  };

}
#endif