sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/eclipse-iceoryx/iceoryx/iceoryx_dds/cmake/cpptoml/cpptoml.cmake.in
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/eclipse-iceoryx/iceoryx/iceoryx_posh/cmake/cpptoml/cpptoml.cmake.in
sed -i "s#v0.1.1#v0.1.1.1#g" src/otrs/eclipse-iceoryx/iceoryx/iceoryx_dds/cmake/cpptoml/cpptoml.cmake.in
sed -i "s#v0.1.1#v0.1.1.1#g" src/otrs/eclipse-iceoryx/iceoryx/iceoryx_posh/cmake/cpptoml/cpptoml.cmake.in
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/ignition/ignition_cmake2_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/ament/uncrustify_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/ament/google_benchmark_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/eProsima/foonathan_memory_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/eclipse-iceoryx/iceoryx/cmake/cyclonedds/cyclonedds-cxx.cmake.in
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/eclipse-iceoryx/iceoryx/cmake/cyclonedds/cyclonedds.cmake.in
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/eclipse-iceoryx/iceoryx/cmake/googletest/googletest.cmake.in
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/otrs/ignition/ignition_math6_vendor/CMakeLists.txt
sed -i "s#https://github.com/curl/curl/releases/download/curl-7_81_0/curl-7.81.0.tar.gz#http://minio.ks.x/github-vendor/curl/curl/curl-7.81.0.tar.gz#g" src/otrs/ros/resource_retriever/libcurl_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/stdROS/rosbag2/zstd_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/stdROS/pybind11_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/stdROS/mimick_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/stdROS/libyaml_vendor/CMakeLists.txt
sed -i "s#https://github.com#http://gitlab.ks.x/github_vendor#g" src/stdROS/orocos_kdl_vendor/orocos_kdl_vendor/CMakeLists.txt
sed -i "s#507de66205e14b12c8c65f25eafc05c4dc66e21e#1e620490c0e52bb4937b8d00a40c57b03f75f9f9#g" src/stdROS/orocos_kdl_vendor/orocos_kdl_vendor/CMakeLists.txt
sed -i "s#https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip#http://minio.ks.x/github-vendor/cameron314/readerwriterqueue/readerwriterqueue-ef7dfbf553288064347d51b8ac335f1ca489032a.zip#g" src/stdROS/rosbag2/shared_queues_vendor/CMakeLists.txt
sed -i "s#https://github.com/cameron314/concurrentqueue/archive/8f65a8734d77c3cc00d74c0532efca872931d3ce.zip#http://minio.ks.x/github-vendor/cameron314/concurrentqueue/concurrentqueue-8f65a8734d77c3cc00d74c0532efca872931d3ce.zip#g" src/stdROS/rosbag2/shared_queues_vendor/CMakeLists.txt
sed -i "s#https://github.com/orocos/orocos_kinematics_dynamics/archive/507de66205e14b12c8c65f25eafc05c4dc66e21e.zip#http://gitlab.ks.x/github_vendor/orocos/orocos_kinematics_dynamics/-/archive/1e620490c0e52bb4937b8d00a40c57b03f75f9f9/orocos_kinematics_dynamics-1e620490c0e52bb4937b8d00a40c57b03f75f9f9.zip#g" src/stdROS/orocos_kdl_vendor/python_orocos_kdl_vendor/CMakeLists.txt
sed -i "s#3f547798ab4461b8247fb764435f3623#e69c22131c7e345a07f16451adedfb0d#g" src/stdROS/orocos_kdl_vendor/python_orocos_kdl_vendor/CMakeLists.txt
sed -i "s#https://www.sqlite.org/2018/sqlite-amalgamation-3240000.zip#http://minio.ks.x/github-vendor/sqlite-amalgamation/sqlite-amalgamation-3240000.zip#g" src/stdROS/rosbag2/sqlite3_vendor/CMakeLists.txt
sed -i "s#https://github.com/assimp/assimp/archive/v4.1.0.tar.gz#http://minio.ks.x/github-vendor/assimp/assimp/assimp-4.1.0.tar.gz#g" src/stdROS/rviz/rviz_assimp_vendor/CMakeLists.txt
sed -i "s#https://git.savannah.gnu.org/cgit/freetype/freetype2.git/snapshot/freetype2-VER-2-6-5.tar.gz#http://minio.ks.x/github-vendor/freetype/freetype2/freetype2-VER-2-6-5.tar.gz#g" src/stdROS/rviz/rviz_ogre_vendor/CMakeLists.txt
sed -i "s#https://github.com/gabime/spdlog/archive/v1.8.2.tar.gz#http://minio.ks.x/github-vendor/gabime/spdlog/spdlog-1.8.2.tar.gz#g" src/stdROS/spdlog_vendor/CMakeLists.txt
sed -i "s#https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.7.0.tar.gz#http://minio.ks.x/github-vendor/jbeder/yaml-cpp/yaml-cpp-yaml-cpp-0.7.0.tar.gz#g" src/stdROS/yaml_cpp_vendor/CMakeLists.txt
sed -i "s#https://git.savannah.gnu.org/cgit/freetype/freetype2.git/snapshot/freetype2-VER-2-6-5.tar.gz#http://minio.ks.x/github-vendor/freetype/freetype2/freetype2-VER-2-6-5.tar.gz#g" src/stdROS/rviz/rviz_ogre_vendor/CMakeLists.txt
sed -i "s#https://www.zlib.net/fossils/zlib-1.2.11.tar.gz#http://minio.ks.x/github-vendor/fossils/zlib/zlib-1.2.11.tar.gz#g" src/stdROS/rviz/rviz_ogre_vendor/CMakeLists.txt
sed -i "s#https://github.com/OGRECave/ogre/archive/v1.12.1.zip#http://minio.ks.x/github-vendor/OGRECave/ogre/ogre-1.12.1.zip#g" src/stdROS/rviz/rviz_ogre_vendor/CMakeLists.txt
sed -i "s#2.4.1#2.4.1.1#g" ros2-humble@ros2.repos
sed -i "s#https://github.com/ros2/pybind11_vendor.git#http://gitlab.ks.x/github_vendor/ros2/pybind11_vendor.git#g" ros2-humble@ros2.repos


sed -i "s#https://github.com#https://ghproxy.com/https://github.com#g" src/stdROS/console_bridge_vendor/package.xml  src/stdROS/console_bridge_vendor/CMakeLists.txt