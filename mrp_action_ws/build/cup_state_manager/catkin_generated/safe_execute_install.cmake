execute_process(COMMAND "/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/seba/MRP/MRP-Praktikum/mrp_action_ws/build/cup_state_manager/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
