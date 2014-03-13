cmake_minimum_required(VERSION 2.8)
project()

# Cmake options
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
enable_testing()

# CC options
add_definitions(-std=gnu99 -O3)
include_directories(${CMAKE_PROJECT_SOURCE_DIR}/src)
link_directories(${CMAKE_PROJECT_BINARY_DIR}/lib)

add_subdirectory(test)
# Targets
add_executable( src/main.c)
target_link_libraries( z)
INSTALL(TARGETS  DESTINATION "bin")
