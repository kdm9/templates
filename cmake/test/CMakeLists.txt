#CFLAGS
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/tinytest)

add_executable(test test.c ${CMAKE_CURRENT_SOURCE_DIR}/tinytest/tinytest.c)
#target_link_libraries(test z)

add_test(NAME test COMMAND test)
