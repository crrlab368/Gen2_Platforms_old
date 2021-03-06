/* Auto-generated by genmsg_cpp for file /home/overkill/devel/ros/Gen2_Platforms/gen2_drivers/gen2_motor_driver/msg/encoder_gyro.msg */
#ifndef GEN2_MOTOR_DRIVER_MESSAGE_ENCODER_GYRO_H
#define GEN2_MOTOR_DRIVER_MESSAGE_ENCODER_GYRO_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"

#include "std_msgs/Header.h"

namespace gen2_motor_driver
{
template <class ContainerAllocator>
struct encoder_gyro_ {
  typedef encoder_gyro_<ContainerAllocator> Type;

  encoder_gyro_()
  : header()
  , right_count(0)
  , left_count(0)
  , gyro_val(0)
  {
  }

  encoder_gyro_(const ContainerAllocator& _alloc)
  : header(_alloc)
  , right_count(0)
  , left_count(0)
  , gyro_val(0)
  {
  }

  typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
   ::std_msgs::Header_<ContainerAllocator>  header;

  typedef int32_t _right_count_type;
  int32_t right_count;

  typedef int32_t _left_count_type;
  int32_t left_count;

  typedef int32_t _gyro_val_type;
  int32_t gyro_val;


private:
  static const char* __s_getDataType_() { return "gen2_motor_driver/encoder_gyro"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "9adda1f0cc5ef21e855eb2b02f332a52"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "Header header\n\
int32 right_count\n\
int32 left_count\n\
int32 gyro_val\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.secs: seconds (stamp_secs) since epoch\n\
# * stamp.nsecs: nanoseconds since stamp_secs\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, header);
    ros::serialization::serialize(stream, right_count);
    ros::serialization::serialize(stream, left_count);
    ros::serialization::serialize(stream, gyro_val);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, header);
    ros::serialization::deserialize(stream, right_count);
    ros::serialization::deserialize(stream, left_count);
    ros::serialization::deserialize(stream, gyro_val);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(header);
    size += ros::serialization::serializationLength(right_count);
    size += ros::serialization::serializationLength(left_count);
    size += ros::serialization::serializationLength(gyro_val);
    return size;
  }

  typedef boost::shared_ptr< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct encoder_gyro
typedef  ::gen2_motor_driver::encoder_gyro_<std::allocator<void> > encoder_gyro;

typedef boost::shared_ptr< ::gen2_motor_driver::encoder_gyro> encoder_gyroPtr;
typedef boost::shared_ptr< ::gen2_motor_driver::encoder_gyro const> encoder_gyroConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace gen2_motor_driver

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > {
  static const char* value() 
  {
    return "9adda1f0cc5ef21e855eb2b02f332a52";
  }

  static const char* value(const  ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x9adda1f0cc5ef21eULL;
  static const uint64_t static_value2 = 0x855eb2b02f332a52ULL;
};

template<class ContainerAllocator>
struct DataType< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > {
  static const char* value() 
  {
    return "gen2_motor_driver/encoder_gyro";
  }

  static const char* value(const  ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > {
  static const char* value() 
  {
    return "Header header\n\
int32 right_count\n\
int32 left_count\n\
int32 gyro_val\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.secs: seconds (stamp_secs) since epoch\n\
# * stamp.nsecs: nanoseconds since stamp_secs\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
";
  }

  static const char* value(const  ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator> struct HasHeader< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct HasHeader< const ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> > : public TrueType {};
} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.header);
    stream.next(m.right_count);
    stream.next(m.left_count);
    stream.next(m.gyro_val);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct encoder_gyro_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::gen2_motor_driver::encoder_gyro_<ContainerAllocator> & v) 
  {
    s << indent << "header: ";
s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "right_count: ";
    Printer<int32_t>::stream(s, indent + "  ", v.right_count);
    s << indent << "left_count: ";
    Printer<int32_t>::stream(s, indent + "  ", v.left_count);
    s << indent << "gyro_val: ";
    Printer<int32_t>::stream(s, indent + "  ", v.gyro_val);
  }
};


} // namespace message_operations
} // namespace ros

#endif // GEN2_MOTOR_DRIVER_MESSAGE_ENCODER_GYRO_H

