/* Auto-generated by genmsg_cpp for file /home/overkill/devel/ros/Gen2_Platforms/rosserial/rosserial_msgs/msg/TopicInfo.msg */
#ifndef ROSSERIAL_MSGS_MESSAGE_TOPICINFO_H
#define ROSSERIAL_MSGS_MESSAGE_TOPICINFO_H
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


namespace rosserial_msgs
{
template <class ContainerAllocator>
struct TopicInfo_ {
  typedef TopicInfo_<ContainerAllocator> Type;

  TopicInfo_()
  : topic_id(0)
  , topic_name()
  , message_type()
  {
  }

  TopicInfo_(const ContainerAllocator& _alloc)
  : topic_id(0)
  , topic_name(_alloc)
  , message_type(_alloc)
  {
  }

  typedef uint16_t _topic_id_type;
  uint16_t topic_id;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _topic_name_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  topic_name;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _message_type_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  message_type;


private:
  static const char* __s_getDataType_() { return "rosserial_msgs/TopicInfo"; }
public:
  ROS_DEPRECATED static const std::string __s_getDataType() { return __s_getDataType_(); }

  ROS_DEPRECATED const std::string __getDataType() const { return __s_getDataType_(); }

private:
  static const char* __s_getMD5Sum_() { return "5b7118c667875cbc7c47734d38bc9992"; }
public:
  ROS_DEPRECATED static const std::string __s_getMD5Sum() { return __s_getMD5Sum_(); }

  ROS_DEPRECATED const std::string __getMD5Sum() const { return __s_getMD5Sum_(); }

private:
  static const char* __s_getMessageDefinition_() { return "uint16 topic_id\n\
string topic_name\n\
string message_type\n\
\n\
"; }
public:
  ROS_DEPRECATED static const std::string __s_getMessageDefinition() { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED const std::string __getMessageDefinition() const { return __s_getMessageDefinition_(); }

  ROS_DEPRECATED virtual uint8_t *serialize(uint8_t *write_ptr, uint32_t seq) const
  {
    ros::serialization::OStream stream(write_ptr, 1000000000);
    ros::serialization::serialize(stream, topic_id);
    ros::serialization::serialize(stream, topic_name);
    ros::serialization::serialize(stream, message_type);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint8_t *deserialize(uint8_t *read_ptr)
  {
    ros::serialization::IStream stream(read_ptr, 1000000000);
    ros::serialization::deserialize(stream, topic_id);
    ros::serialization::deserialize(stream, topic_name);
    ros::serialization::deserialize(stream, message_type);
    return stream.getData();
  }

  ROS_DEPRECATED virtual uint32_t serializationLength() const
  {
    uint32_t size = 0;
    size += ros::serialization::serializationLength(topic_id);
    size += ros::serialization::serializationLength(topic_name);
    size += ros::serialization::serializationLength(message_type);
    return size;
  }

  typedef boost::shared_ptr< ::rosserial_msgs::TopicInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rosserial_msgs::TopicInfo_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct TopicInfo
typedef  ::rosserial_msgs::TopicInfo_<std::allocator<void> > TopicInfo;

typedef boost::shared_ptr< ::rosserial_msgs::TopicInfo> TopicInfoPtr;
typedef boost::shared_ptr< ::rosserial_msgs::TopicInfo const> TopicInfoConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::rosserial_msgs::TopicInfo_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::rosserial_msgs::TopicInfo_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace rosserial_msgs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::rosserial_msgs::TopicInfo_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::rosserial_msgs::TopicInfo_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::rosserial_msgs::TopicInfo_<ContainerAllocator> > {
  static const char* value() 
  {
    return "5b7118c667875cbc7c47734d38bc9992";
  }

  static const char* value(const  ::rosserial_msgs::TopicInfo_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x5b7118c667875cbcULL;
  static const uint64_t static_value2 = 0x7c47734d38bc9992ULL;
};

template<class ContainerAllocator>
struct DataType< ::rosserial_msgs::TopicInfo_<ContainerAllocator> > {
  static const char* value() 
  {
    return "rosserial_msgs/TopicInfo";
  }

  static const char* value(const  ::rosserial_msgs::TopicInfo_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::rosserial_msgs::TopicInfo_<ContainerAllocator> > {
  static const char* value() 
  {
    return "uint16 topic_id\n\
string topic_name\n\
string message_type\n\
\n\
";
  }

  static const char* value(const  ::rosserial_msgs::TopicInfo_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::rosserial_msgs::TopicInfo_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.topic_id);
    stream.next(m.topic_name);
    stream.next(m.message_type);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct TopicInfo_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rosserial_msgs::TopicInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::rosserial_msgs::TopicInfo_<ContainerAllocator> & v) 
  {
    s << indent << "topic_id: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.topic_id);
    s << indent << "topic_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.topic_name);
    s << indent << "message_type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.message_type);
  }
};


} // namespace message_operations
} // namespace ros

#endif // ROSSERIAL_MSGS_MESSAGE_TOPICINFO_H

