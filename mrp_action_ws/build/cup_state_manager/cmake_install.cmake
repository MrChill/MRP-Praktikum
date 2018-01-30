# Install script for directory: /home/seba/MRP/MRP-Praktikum/mrp_action_ws/src/cup_state_manager

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  include("/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/installspace/cup_state_manager.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cup_state_manager/cmake" TYPE FILE FILES
    "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/installspace/cup_state_managerConfig.cmake"
    "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/installspace/cup_state_managerConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cup_state_manager" TYPE FILE FILES "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/src/cup_state_manager/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cup_state_manager" TYPE PROGRAM FILES "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/installspace/cup_transport_server")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cup_state_manager" TYPE PROGRAM FILES "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/installspace/start_dummy_robots")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cup_state_manager" TYPE PROGRAM FILES "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/installspace/start_cup_transport")
endif()

