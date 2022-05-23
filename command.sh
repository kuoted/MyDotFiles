docker run -it --name ros2ubuntu -p 2222:22 -v /home/kuoted/02_ubuntu2004:/home/kuoted/02_ubuntu2004  ubuntu:20.04
docker run -it --name autosarap -p 2223:22 -v /home/kuoted/03_ubuntu1604:/home/kuoted/03_ubuntu1604  ubuntu:16.04
docker run -it --name autosarap -p 2223:22 -v /home/kuoted/03_ubuntu1604:/home/kuoted/03_ubuntu1604  ubuntu:16.04
docker run -it --name 03_mdc_simulator -p 2225:22 -v /home/kuoted/04_ubuntu1804:/home/kuoted/04_ubuntu1804 -v /home/kuoted/00_shared_common:/home/kuoted/00_shared_common  ubuntu:18.04


colcon build --symlink-install --event-handlers compile_commands+ console_cohesion- --cmake-args -D -DCMAKE_EXPORT_COMPILE_COMMANDS=1 --cmake-force-configure

sudo dpkg-reconfigure dash
