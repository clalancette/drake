#!/bin/bash -x

pkill -f drake-visualizer
pkill -f steering_command_driver
pkill -f chris_sim_lcm

bazel build drake/automotive:demo drake/automotive:car_sim_lcm drake/automotive:chris_sim_lcm
bazel-bin/external/drake_visualizer/drake-visualizer &
sleep 1
bazel-bin/drake/automotive/steering_command_driver &
sleep 1
bazel run drake/automotive:chris_sim_lcm &
