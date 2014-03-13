#CFLAGS
include_directories(tinytest)
add_executable(test test.c tinytest/tinytest.c)
target_link_libraries(test z)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY bin)

add_test(NAME test COMMAND test)
