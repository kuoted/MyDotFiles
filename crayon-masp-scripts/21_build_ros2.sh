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
if [ -d $WORK_DIR/ws ] && [ -d $WORK_DIR/ws ]; then
  cd $WORK_DIR/ws && colcon build --symlink-install \
    --event-handlers compile_commands+ console_direct- console_cohesion- \
    --cmake-args -DTRACETOOLS_DISABLED=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -DBUILD_TESTING=OFF \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    --no-warn-unused-cli \
    --base-paths $WORK_DIR/src/stdROS $WORK_DIR/src/otrs $WORK_DIR/src/thirdparty/kernelsoftdds \
    --packages-up-to \
    rmw_kernelsoftdds_cpp \
    launch_xml \
    launch_yaml \
    ros2action \
    ros2cli \
    ros2component \
    ros2doctor \
    ros2interface \
    ros2launch \
    ros2lifecycle \
    ros2multicast \
    ros2node \
    ros2param \
    ros2pkg \
    ros2run \
    ros2service \
    ros2topic \
    ros2trace \
    ament_clang_format \
    demo_nodes_cpp \

  cd -
else
  echo "error occured."
fi

# rmw_connextdds \
# rmw_fastrtps_cpp \
# rmw_cyclonedds_cpp \
    # demo_nodes_py
#--packages-skip-build-finished \
#colcon build  --symlink-install --event-handlers compile_commands+ console_direct+ console_cohesion+    --cmake-args -DTRACETOOLS_DISABLE=ON -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_VERBOSE_MAKEFILE=OFF --no-warn-unused-cli  --base-paths /home/kuoted/01_work/04_crayon-masp/dev/src/* --packages-up-to ks_executor ros2cli_build_stub irobot_events_executor
