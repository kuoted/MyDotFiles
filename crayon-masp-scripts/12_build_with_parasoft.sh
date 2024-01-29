# !/usr/bin/zsh

WORK_DIR=$(
  cd $(dirname $0) &&
    cd .. &&
    pwd
)

export PARASOFT_HOME=$HOME/01_work/tools/cpptest
export PATH=$PATH:$PARASOFT_HOME:$PARASOFT_HOME/bin

rm -rf $WORK_DIR/ws/install/rclcpp \
  $WORK_DIR/ws/build/rclcpp \
  $WORK_DIR/ws/build/rosidl_runtime_c* \
  $WORK_DIR/ws/build/rosidl_typesupport_* \
  $WORK_DIR/build/rcl* \
  $WORK_DIR/build/rmw* \
  $WORK_DIR/build/rcpputils \
  $WORK_DIR/build/rcutils \
  $WORK_DIR/build/ament_index_cpp

# $WORK_DIR/ws/build/rcl \
# $WORK_DIR/ws/install/rcl \
# $WORK_DIR/ws/build/rmw \
# $WORK_DIR/ws/install/rmw \
# $WORK_DIR/ws/build/rmw_implementation \
# $WORK_DIR/ws/install/rmw_implementation \
# $WORK_DIR/ws/build/rmw_kernelsoftdds_cpp \
# $WORK_DIR/ws/install/rmw_kernelsoftdds_cpp

#cpptesttrace --cpptesttraceProjectName=ros2auto_rclcpp_git_3 --cpptesttraceOutputFile=$PWD/ros2auto_rclcpp_git_3.bdf  --cpptesttraceTraceCommand=c++ ./10_build_ks_app_20_and_dependency.sh
cpptesttrace --cpptesttraceProjectName=AdaptiveCore_rclcpp_git_3 --cpptesttraceOutputFile=$PWD/AdaptiveCore_rclcpp_git_3.bdf ./11_build_ks_app_20_and_dependency.sh
# cpptesttrace --cpptesttraceProjectName=AdaptiveCore_git_3 --cpptesttraceOutputFile=$PWD/AdaptiveCore_git_3.bdf ./10_build_ks_app_20_and_dependency.sh
# cpptesttrace --cpptesttraceProjectName=AdaptiveCore_ART1230_git_3 --cpptesttraceOutputFile=$PWD/AdaptiveCore_ART1230_git_3.bdf ./21_build_ros2.sh
#cpptesttrace --cpptesttraceProjectName=ros2auto_git_3 --cpptesttraceOutputFile=$PWD/ros2auto_git_3.bdf  $WORK_DIR/scripts/21_build_ros2.sh

## filters
# all about single-thread and multi-thread executors
# **/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/multi_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/multi_threaded_executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/single_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/single_threaded_executor.cpp
# **/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/multi_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/multi_threaded_executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/single_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/single_threaded_executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/static_single_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/static_single_threaded_executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/static_executor_entities_collector.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/static_executor_entities_collector.cpp
# **/include/rclcpp/executor.hpp,**/src/rclcpp/executor.cpp,**/include/rclcpp/executors/multi_threaded_executor.hpp,**/src/rclcpp/executors/multi_threaded_executor.cpp,**/include/rclcpp/executors/single_threaded_executor.hpp,**/src/rclcpp/executors/single_threaded_executor.cpp

# **/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor.hpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor_options.hpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/**,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executor.cpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors.cpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/**
#rm build/rosidl_runtime_c* -r
#rm build/rosidl_typesupport_* -r
#rm build/rcl* -r
#rm build/rmw* -r
#rm build/rcpputils build/rcutils build/ament_index_cpp -r
