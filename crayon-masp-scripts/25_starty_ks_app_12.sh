# !/usr/bin/bash

echo $0
WORK_DIR=$(
  cd $(dirname $0)
  pwd
)

if [ ! -d "$WORK_DIR" ]; then
  echo "search src failed."
  exit -1
fi
export KS_EXECUTOR_CONF_PATH=$WORK_DIR/../src/stdROS/ks_extention/ks-reference-system/
echo $KS_EXECUTOR_CONF_PATH
export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

. $WORK_DIR/../ws/install/setup.bash

export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
export DEFAULT_RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

#ros2 run ks_app_12 ks_app_12.elf   -p 630demo -d app_12/dag/cyclic-BehaviorPlanner.dag -d app_12/dag/fusion-Lanelet2MapLoader.dag -d app_12/dag/sensor-Lanelet2Map.dag -d app_12/dag/transform-LanePlanner.dag -d app_12/dag/transform-MPCController.dag -d app_12/dag/transform-ParkingPlanner.dag

ros2 run ks_app_12 ks_app_12.elf -p 630demo -d app_12/dag/cyclic-BehaviorPlanner.dag -d app_12/dag/fusion-Lanelet2MapLoader.dag -d app_12/dag/sensor-Lanelet2Map.dag -d app_12/dag/transform-LanePlanner.dag -d app_12/dag/transform-MPCController.dag -d app_12/dag/transform-ParkingPlanner.dag -d app_12/dag/deterexec-DeterministicExecution.dag
