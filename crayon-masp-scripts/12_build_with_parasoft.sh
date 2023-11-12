# !/usr/bin/zsh

WORK_DIR=$(
  cd $(dirname $0) &&
    cd .. &&
    pwd
)

export PARASOFT_HOME=/home/kuoted/01_work/tools/cpptest
export PATH=$PATH:$PARASOFT_HOME:$PARASOFT_HOME/bin
#cpptesttrace --cpptesttraceProjectName=ros2auto_rclcpp_git_3 --cpptesttraceOutputFile=$PWD/ros2auto_rclcpp_git_3.bdf  --cpptesttraceTraceCommand=c++ ./10_build_ks_app_20_and_dependency.sh
cpptesttrace --cpptesttraceProjectName=ros2auto_rclcpp_git_3 --cpptesttraceOutputFile=$PWD/ros2auto_rclcpp_git_3.bdf  $WORK_DIR/scripts/10_build_ks_app_20_and_dependency.sh


## filters
# all about single-thread and multi-thread executors
# **/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/multi_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/multi_threaded_executor.cpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/single_threaded_executor.hpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/single_threaded_executor.cpp

# **/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor.hpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executor_options.hpp,**/src/stdROS/rclcpp/rclcpp/include/rclcpp/executors/**,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executor.cpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors.cpp,**/src/stdROS/rclcpp/rclcpp/src/rclcpp/executors/**
