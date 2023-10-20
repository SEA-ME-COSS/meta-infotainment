cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread -std=c++0x")

include_directories(
    src-gen-manager
    ${CMAKE_INCLUDE_PATH}/CommonAPI-3.2
    ${CMAKE_INCLUDE_PATH}
)
link_directories(
    ${CMAKE_LIBRARY_PATH}
)
add_executable(SpeedClient
        src/SpeedClient.cpp
        src-gen-manager/v1/commonapi/ManagerSomeIPProxy.cpp
        src-gen-manager/v1/commonapi/ManagerSomeIPDeployment.cpp
)
target_link_libraries(SpeedClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(RpmClient
        src/RpmClient.cpp
        src-gen-manager/v1/commonapi/ManagerSomeIPProxy.cpp
        src-gen-manager/v1/commonapi/ManagerSomeIPDeployment.cpp
)
target_link_libraries(RpmClient CommonAPI CommonAPI-SomeIP vsomeip3)
add_executable(ManagerService
        src/ManagerService.cpp
        src/ManagerStubImpl.cpp
        src-gen-manager/v1/commonapi/ManagerSomeIPStubAdapter.cpp
        src-gen-manager/v1/commonapi/ManagerSomeIPDeployment.cpp
)
target_link_libraries(ManagerService CommonAPI CommonAPI-SomeIP vsomeip3)

install(TARGETS RpmClient DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS SpeedClient DESTINATION /usr/bin/example/vsomeip-example)
install(TARGETS ManagerService DESTINATION /usr/bin/example/vsomeip-example)

