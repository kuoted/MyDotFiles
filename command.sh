docker run -it --name ros2ubuntu -p 2222:22 -v /home/kuoted/02_ubuntu2004:/home/kuoted/02_ubuntu2004  ubuntu:20.04
docker run -it --name autosarap -p 2223:22 -v /home/kuoted/03_ubuntu1604:/home/kuoted/03_ubuntu1604  ubuntu:16.04
docker run -it --name autosarap -p 2223:22 -v /home/kuoted/03_ubuntu1604:/home/kuoted/03_ubuntu1604  ubuntu:16.04
docker run -it --name humbleWithDebug -p 2223:22 -v /Users/kuoted/01_work/02_kernelsoft/1_framework:/home/kuoted/1_framework  ef3e17427ebc
docker run -it --name 03_mdc_simulator -p 2225:22 -v /home/kuoted/04_ubuntu1804:/home/kuoted/04_ubuntu1804 -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  ubuntu:18.04


docker run -it --name 04_ccu_sim -p 2226:22 -v /home/kuoted/04_ccu:/home/kuoted/04_ccu -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  cvsuser/ubuntu1804:mdc610_x86_simulator
docker run -it --name 05_mdc_sim -p 2227:22 -v /home/kuoted/05_mdc:/home/kuoted/05_mdc -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  cvsuser/ubuntu1804:mdc610_x86_simulator
docker run -it --name 05_mdc_sim -p 2228:22 -v  /home/kuoted/04_ubuntu1804:/home/kuoted/04_ubuntu1804 -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common cvsuser/mdc610_x86_simulator


colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure
colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DBUILD_TESTING=OFF -Wno-dev --no-warn-unused-cli --cmake-force-configure --packages-up-to ros_core 
colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -Wno-dev --no-warn-unused-cli --cmake-force-configure
colcon build --merge-install --symlink-install --event-handlers compile_commands+ console_direct+ console_cohesion+ --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DTRACETOOLS_DISABLE=ON   -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -DCMAKE_VERBOSE_MAKEFILE=ON  -Wno-dev --no-warn-unused-cli --cmake-force-configure --base-paths /home/kuoted/01_work/04_crayon-masp/102_EM_SM_merge_crayon-masp/src/framework --packages-up-to 
colcon build --symlink-install --cmake-args -DTRACETOOLS_DISABLE=ON -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_VERBOSE_MAKEFILE=ON  --no-warn-unused-cli --cmake-force-configure  --base-paths ../src ../src/stdROS/ks_executor/tools --packages-up-to ros2cli_build_stub irobot_events_executor
colcon build --symlink-install --event-handlers  console_direct+ --cmake-args -DTRACETOOLS_DISABLE=ON -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_VERBOSE_MAKEFILE=ON  --no-warn-unused-cli --cmake-force-configure
colcon build --symlink-install --cmake-args -DCMAKE_CXX_FLAGS='-fprofile-arcs -ftest-coverage' -DCMAKE_C_FLAGS='-fprofile-arcs -ftest-coverage' --packages-up-to execution_mgr_cpp execution_mgr_py

sudo dpkg-reconfigure dash


python3 -m pip  install -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ cmake_format
python3 -m pip  install -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ setuptools==58.2.0
python3 -m pip  install -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ 
#回退安装指令
pip install setuptools==58.2.0


#### How to build vsomeipv3
git clone https://github.com/COVESA/vsomeip.git
sudo apt install libboost-system-dev libboost-thread-dev libboost-log-dev 

cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DDEFAULT_CONFIGURATION_FOLDER=/home/kuoted/01_work/103_galactic/300_depends/vsomeip/config -DENABLE_SIGNAL_HANDLING=1


ros2 pkg create execute_management_action --build-type ament_cmake --dependencies rclcpp em_sm_common ExecuteMangementAction

diff -ruNa lttng-modules-2.13.9 ../lttng-modules-2.13.9
$ git config --add oh-my-zsh.hide-dirty 1
#如果你还觉得慢，可以再设置 oh-my-zsh 不读取任何 git 信息
git config --global --add oh-my-zsh.hide-dirty 1
git config --global --add oh-my-zsh.hide-status 1
git config --global pager.branch false
git config --global pager.reflog false
git config --global pager.log less
git config --global core.longpaths true
git config --global core.autocrlf false
git config --global core.filemode false
# and for fun!
git config --global color.ui true
git config --global credential.helper store


lttng create em_tracing --output=`pwd`/em_trace/`date +%Y%m%dT%H-%M-%S`
find . -type f -size +200M
find -name *.o | xargs truncate -s 0

export PATH=/home/kuoted/tools/depot_tools:/home/kuoted/.local/bin:/home/kuoted/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export SOMEIP_CONFIG_FILE=~/05_mdc/02_x86_emulator/PLATFORM_Sample/outputcfg/MdcADpGeaMachine/someipd-InnerEthernetCommConnector.json 
export CM_CONFIG_FILE_PATH=~/05_mdc/02_x86_emulator/PLATFORM_Sample/outputcfg/MdcADpGeaMachine/someip_method_kpoll_server_sample/SomeipMethodKpollServerSampleProcess
export MAKEFLAGS="-j 1"
export RCUTILS_COLORIZED_OUTPUT=1
export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})"
export https_proxy=http://172.26.192.7:7890 http_proxy=http://172.26.192.7:7890

gcovr -r src/stdROS/rclcpp/rclcpp -f src/stdROS/rclcpp/rclcpp/src/ -f src/stdROS/rclcpp/rclcpp/include --exclude-directories test/rclcpp -e test_* unit_test_ws/build/rclcpp/ --decisions --html 1.html
