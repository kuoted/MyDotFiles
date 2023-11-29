# !/bin/zsh

WORK_DIR=$(
  cd $(dirname $0) &&
    cd .. &&
    pwd
)

if [ ! -d "$WORK_DIR" ]; then
  echo "search src failed."
  exit -1
fi
exist_and_import() {
  if [ -f $1 ]; then
    source $1
  fi
}
export RTI_LICENSE_FILE=/home/kuoted/rti_connext_dds-6.1.1/rti_license814.dat
get_arch=$(arch)
if [[ $get_arch =~ "x86_64" ]]; then
  echo "this is x86_64"
  exist_and_import /home/kuoted/rti_connext_dds-6.1.1/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.zsh
elif [[ $get_arch =~ "aarch64" ]]; then
  echo "this is arm64"
  exist_and_import /home/kuoted/rti_connext_dds-6.1.1/resource/scripts/rtisetenv_armv8Linux4gcc7.3.0.zsh
  source $WORK_DIR/ws/install/setup.zsh
elif [[ $get_arch =~ "mips64" ]]; then
  echo "this is mips64"
else
  echo "unknown!!"
fi

#shell判断文件夹是否存在

#如果文件夹不存在，创建文件夹
if [[ -d "$WORK_DIR/src" ]]; then
  export KS_EXECUTOR_CONF_PATH=$WORK_DIR/src/stdROS/ks_extention/ks-reference-system/ks_app_20
  export KERNELSOFTDDS_URI=$WORK_DIR/scripts/kernelsoftdds_config.xml
fi

# -f 参数判断 $file 是否存在
if [ -f "$WORK_DIR/ws/install/setup.zsh" ]; then
  echo "here 1"
  source $WORK_DIR/ws/install/setup.zsh
elif [ -f "$WORK_DIR/src" ]; then
  source $WORK_DIR/ws/install/setup.zsh
  echo "here 2"
fi

export RCUTILS_COLORIZED_OUTPUT=1

if [[ $1 -eq 1 ]]; then
  export RMW_IMPLEMENTATION=rmw_kernelsoftdds_cpp
  debug_var_info=$WORK_DIR/.vscode/env_launch_ros2.ks_app_20.elf_kernelsoftdds
elif [[ $1 -eq 2 ]]; then
  export RMW_IMPLEMENTATION=rmw_connextdds
  debug_var_info=$WORK_DIR/.vscode/env_launch_ros2.ks_app_20.elf_rti_dds
elif [[ $1 -eq 3 ]]; then
  export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
  debug_var_info=$WORK_DIR/.vscode/env_launch_ros2.ks_app_20.elf_cyclonedds
elif [[ $1 -eq 4 ]]; then
  export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
  debug_var_info=$WORK_DIR/.vscode/env_launch_ros2.ks_app_20.elf_fastdds
else
  export RMW_IMPLEMENTATION=rmw_kernelsoftdds_cpp
  debug_var_info=$WORK_DIR/.vscode/env_launch_ros2.ks_app_20.elf_kernelsoftdds
fi
echo -e "\e[31m$RMW_IMPLEMENTATION \e[0m"
sleep 1

#export DEFAULT_RMW_IMPLEMENTATION=rmw_kernelsoftdds_cpp
#export DEFAULT_RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# -f 参数判断 $file 是否存在
if [ ! -f "$debug_var_info" ]; then
  printenv >$debug_var_info
fi
#export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})"
export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message} ({file_name}:{line_number})"
export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message}"
export ROS_HOME=$WORK_DIR/ws/report
colcon test \
  --merge-install \
  --event-handlers compile_commands+ console_direct+ console_cohesion+ \
  --base-paths \
  $WORK_DIR/src/* \
  $WORK_DIR/src/thirdparty/kernelsoftdds \
  $WORK_DIR/src/thirdparty/ks-reference-system \
  --packages-select \
  rclcpp

# --packages-select autoware_reference_system
# ros2 run ks_app_20 ks_app_20.elf -p 630demo \
#   -d dag/sensor-Lanelet2Map.dag \
#   -d dag/fusion-Lanelet2MapLoader.dag \
#   -d dag/transform-LanePlanner.dag \
#   -d dag/transform-ParkingPlanner.dag \
#   -d dag/cyclic-BehaviorPlanner.dag \
#   -d dag/transform-MPCController.dag \
#   -d dag/fusion-VehicleInterface.dag

# export RMW_IMPLEMENTATION=rmw_kernelsoftdds_cpp
# ros2 service call /test/add_two_ints example_interfaces/srv/AddTwoInts "{a: 3,b: 4}"
# ros2 topic pub /topic/process/ctrl std_msgs/msg/String '{data: close}'
