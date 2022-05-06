cmake_minimum_required(VERSION 3.10)
set(TEST_OUT_DIRECTORY ${CMAKE_BINARY_DIR}/../test)
#set(EXECUTABLE_OUTPUT_PATH bin)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/../bin)
include(${CMAKE_SOURCE_DIR}/lib/CMakeLists.txt)


SET(CMAKE_CXX_FLAGS "-g -O0 -Wall -fprofile-arcs -ftest-coverage")
SET(CMAKE_C_FLAGS "-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
SET(CMAKE_EXE_LINKER_FLAGS "-fprofile-arcs -ftest-coverage")


include_directories(${CMAKE_SOURCE_DIR}/src)
project(main)

#list(REMOVE_ITEM lib_srcs "main.cpp")
file(GLOB SOURCES ${CMAKE_SOURCE_DIR}/src/*.cpp)
foreach(surce  ${SOURCES})
  message(STATUS "source='${surce}'")
endforeach()

add_executable(main ${SOURCES})
if(WIN32)
  message(STATUS "OS_detect=WIN32")
  target_link_libraries(main wsock32 ws2_32)
endif()
if(UNIX)
  message(STATUS "OS_detect=UNIX")
  target_link_libraries(main -pthread)
endif()

get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
  message(STATUS "includes='${dir}'")
endforeach()

enable_testing()
#compile tests
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${TEST_OUT_DIRECTORY})


file(GLOB TESTS ${CMAKE_SOURCE_DIR}/test/*.cpp)
foreach(test ${TESTS})
  message(STATUS "testDir='${test}'")
endforeach()


foreach(test ${TESTS})
  get_filename_component(TESTNAME ${test} NAME_WLE)
  set(TESTNAME "Test_${TESTNAME}")
  message(STATUS "test='${TESTNAME}'")
  message(STATUS "testDir='${test}'")
  add_executable(${TESTNAME} ${test})
  add_test(${TESTNAME} "${TEST_OUT_DIRECTORY}/${TESTNAME}")
  
endforeach()



