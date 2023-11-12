#!/bin/zsh

get_arch=$(arch)
if [[ $get_arch =~ "x86_64" ]]; then
  echo "this is x86_64"
elif [[ $get_arch =~ "aarch64" ]]; then
  echo "this is arm64"
  source /home/kuoted/01_work/04_crayon-masp/dev/ws/install/setup.zsh
elif [[ $get_arch =~ "mips64" ]]; then
  echo "this is mips64"
else
  echo "unknown!!"
fi

#shell判断文件夹是否存在

#如果文件夹不存在，创建文件夹
if [ -d "/home/kuoted/01_work/04_crayon-masp/dev/src" ]; then
  export KS_EXECUTOR_CONF_PATH=/home/kuoted/01_work/04_crayon-masp/dev/src/stdROS/ks_extention/ks-reference-system/ks_app_20
elif [ -d "/home/kuoted/01_work/04_crayon-masp/dev/src" ]; then
  export KS_EXECUTOR_CONF_PATH=/home/kuoted/01_work/03_autoware_ros2auto/2_ros2_auto/src/stdROS/ks_extention/ks-reference-system/app_12
fi

# -f 参数判断 $file 是否存在
if [ -f "/home/kuoted/01_work/04_crayon-masp/dev/ws/install/setup.zsh" ]; then
  source /home/kuoted/01_work/04_crayon-masp/dev/ws/install/setup.zsh
elif [ -f "/home/kuoted/01_work/04_crayon-masp/dev/src" ]; then
  source /home/kuoted/01_work/03_autoware_ros2auto/2_ros2_auto/ws/install/setup.zsh
fi

#export KS_EXECUTOR_CONF_PATH=/data/AdaptiveCore/crayon-masp/src/stdROS/ks_extention/ks-reference-system/app_12
export RCUTILS_COLORIZED_OUTPUT=1
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export DEFAULT_RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
#source /data/AdaptiveCore/crayon-masp/ws/STANDARD/install/setup.bash

ros2 run ks_app_20 ks_app_20.elf -p 630demo-schedule-other \
  -d dag/sensor-Lanelet2Map.dag \
  -d dag/fusion-Lanelet2MapLoader.dag \
  -d dag/transform-LanePlanner.dag \
  -d dag/transform-ParkingPlanner.dag \
  -d dag/cyclic-BehaviorPlanner.dag \
  -d dag/transform-MPCController.dag \
  -d dag/fusion-VehicleInterface.dag
