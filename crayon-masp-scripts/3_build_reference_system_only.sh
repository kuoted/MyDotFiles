# !/usr/bin/zsh

WORK_DIR=$(
  cd $(dirname $0) &&
    cd .. &&
    pwd
)

if [ ! -d "$WORK_DIR" ]; then
  echo "search src failed."
  exit -1
fi
mkdir -p $WORK_DIR/ws

if [ -d $WORK_DIR/ws ] && [ -d $WORK_DIR/ws ]; then
  #export MAKEFLAGS='VERBOSE=1'
  cd $WORK_DIR/ws && colcon build --symlink-install \
    --event-handlers compile_commands+ console_direct+ console_cohesion+ \
    --cmake-args -DTRACETOOLS_DISABLE=ON \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -DBUILD_TESTING=ON \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -DCMAKE_VERBOSE_MAKEFILE=OFF \
    --no-warn-unused-cli \
    --base-paths $WORK_DIR/src/* $WORK_DIR/src/thirdparty/ks-reference-system \
    --packages-select ament_cmake_auto autoware_reference_system
  cd -
else
  echo "error occured."
fi

#colcon build --symlink-install --event-handlers  console_direct+ compile_commands+ --cmake-args -DTRACETOOLS_DISABLE=ON -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_VERBOSE_MAKEFILE=ON -DRUN_BENCHMARK=ON --no-warn-unused-cli --cmake-force-configure --base-paths ../src/thirdparty/ks-reference-system ../src   --packages-select ament_cmake_auto  autoware_reference_system
