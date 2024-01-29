# !/usr/bin/zsh

WORK_DIR=$(
  cd $(dirname $0) &&
    cd .. &&
    pwd
)

exist_and_import() {
  if [ -f $1 ]; then
    source $1
  fi
}
export RTI_LICENSE_FILE=/home/kuoted/rti_connext_dds-6.1.1/rti_license.dat
get_arch=$(arch)
if [[ $get_arch =~ "x86_64" ]]; then
  echo "this is x86_64"
  exist_and_import /home/kuoted/rti_connext_dds-6.1.1/resource/scripts/rtisetenv_x64Linux4gcc7.3.0.zsh
elif [[ $get_arch =~ "aarch64" ]]; then
  echo "this is arm64"
  exist_and_import /home/kuoted/rti_connext_dds-6.1.1/resource/scripts/rtisetenv_armv8Linux4gcc7.3.0.zsh
  #source $WORK_DIR/ws/install/setup.zsh
elif [[ $get_arch =~ "mips64" ]]; then
  echo "this is mips64"
else
  echo "unknown!!"
fi

if [ ! -d "$WORK_DIR" ]; then
  echo "search src failed."
  exit -1
fi
mkdir -p $WORK_DIR/ws

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

export MAKEFLAGS='VERBOSE=1'
export RMW_IMPLEMENTATION=rmw_kernelsoftdds_cpp
export DEFAULT_RMW_IMPLEMENTATION=rmw_kernelsoftdds_cpp

if [ -d $WORK_DIR/ws ] && [ -d $WORK_DIR/ws ]; then
  cd $WORK_DIR/ws && colcon build --symlink-install \
    --event-handlers \
    compile_commands+ \
    console_direct- \
    console_cohesion- \
    --cmake-args \
    -DTRACETOOLS_DISABLE=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -DBUILD_TESTING=ON \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -DRUN_BENCHMARK=ON \
    -DALL_RMWS=ON \
    -DENABLE_SHM=ON \
    -DCMAKE_VERBOSE_MAKEFILE=OFF \
    --no-warn-unused-cli \
    --base-paths \
    $WORK_DIR/src/ \
    $WORK_DIR/src/otrs \
    $WORK_DIR/src/stdROS \
    $WORK_DIR/src/stdROS/rmw_kernelsoftdds \
    $WORK_DIR/src/thirdparty/kernelsoftdds \
    --packages-up-to \
    rclcpp \
    kernelsoftdds \
    demo_nodes_cpp \
    examples_rclcpp_minimal_publisher \
    examples_rclcpp_minimal_subscriber \
    ks_app_20

  cd -
else
  echo "error occured."
fi

# ks_app_30 \
# rmw_connextdds \
# rmw_kernelsoftdds_cpp \
# examples_rclcpp_minimal_subscriber
# picas_single_executor \
# picas_multi_executor \
#--packages-skip-build-finished \
#colcon build  --symlink-install --event-handlers compile_commands+ console_direct+ console_cohesion+    --cmake-args -DTRACETOOLS_DISABLE=ON -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_VERBOSE_MAKEFILE=OFF --no-warn-unused-cli  --base-paths /home/kuoted/01_work/04_crayon-masp/dev/src/* --packages-up-to ks_executor ros2cli_build_stub irobot_events_executor
