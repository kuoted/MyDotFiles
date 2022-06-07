docker run -it --name ros2ubuntu -p 2222:22 -v /home/kuoted/02_ubuntu2004:/home/kuoted/02_ubuntu2004  ubuntu:20.04
docker run -it --name autosarap -p 2223:22 -v /home/kuoted/03_ubuntu1604:/home/kuoted/03_ubuntu1604  ubuntu:16.04
docker run -it --name autosarap -p 2223:22 -v /home/kuoted/03_ubuntu1604:/home/kuoted/03_ubuntu1604  ubuntu:16.04
docker run -it --name 03_mdc_simulator -p 2225:22 -v /home/kuoted/04_ubuntu1804:/home/kuoted/04_ubuntu1804 -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  ubuntu:18.04


docker run -it --name 04_ccu_sim -p 2226:22 -v /home/kuoted/04_ccu:/home/kuoted/04_ccu -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  cvsuser/ubuntu1804:mdc610_x86_simulator
docker run -it --name 05_mdc_sim -p 2227:22 -v /home/kuoted/05_mdc:/home/kuoted/05_mdc -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  cvsuser/ubuntu1804:mdc610_x86_simulator
docker run -it --name 05_mdc_sim -p 2228:22 -v  /home/kuoted/04_ubuntu1804:/home/kuoted/04_ubuntu1804 -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common cvsuser/mdc610_x86_simulator

colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -D -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure
colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DBUILD_TESTING=OFF -Wno-dev --no-warn-unused-cli --cmake-force-configure --packages-up-to ros_core 
colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE:STRING=Debug -DBUILD_TESTING=OFF -Wno-dev --no-warn-unused-cli --cmake-force-configure

sudo dpkg-reconfigure dash

export SOMEIP_CONFIG_FILE=~/05_mdc/02_x86_emulator/PLATFORM_Sample/outputcfg/MdcADpGeaMachine/someipd-InnerEthernetCommConnector.json 
export CM_CONFIG_FILE_PATH=~/05_mdc/02_x86_emulator/PLATFORM_Sample/outputcfg/MdcADpGeaMachine/someip_method_kpoll_server_sample/SomeipMethodKpollServerSampleProcess

python3 -m pip  install -U -i https://pypi.tuna.tsinghua.edu.cn/simple/ cmake_format
