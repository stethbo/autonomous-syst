#include <webots/robot.h>
#include <webots/distance_sensor.h>
#include <webots/motor.h>
#include <webots/accelerometer.h>
#include <stdio.h>
#include <stdlib.h>

#define TIME_STEP 64
#define MAX_SPEED 6.28

WbDeviceTag leftMotor, rightMotor, accelerometer;

void turn_left(int steps) {
  while (steps > 0) {
    wb_motor_set_velocity(leftMotor, -0.5 * MAX_SPEED);
    wb_motor_set_velocity(rightMotor, 0.5 * MAX_SPEED);
    wb_robot_step(TIME_STEP);
    steps--;
  }
}

void turn_right(int steps) {
  while (steps > 0) {
    wb_motor_set_velocity(leftMotor, 0.5 * MAX_SPEED);
    wb_motor_set_velocity(rightMotor, -0.5 * MAX_SPEED);
    wb_robot_step(TIME_STEP);
    steps--;
  }
}

void go_forward(int steps, double v) {
  while (steps > 0) {
    wb_motor_set_velocity(leftMotor, v * MAX_SPEED);
    wb_motor_set_velocity(rightMotor, v * MAX_SPEED);
    wb_robot_step(TIME_STEP);
    steps--;
  }
}

void go_backward(int steps, double v) {
  while (steps > 0) {
    wb_motor_set_velocity(leftMotor, -v * MAX_SPEED);
    wb_motor_set_velocity(rightMotor, -v * MAX_SPEED);
    wb_robot_step(TIME_STEP);
    steps--;
  }
}

void avoid_obstacle_right() {
  go_backward(11, 0.5);
  turn_left(5);
  go_forward(21, 0.5);
  turn_right(18);
  go_forward(58, 0.5);
  turn_right(5);
  go_forward(10, 0.5);
  turn_left(17);
  go_forward(8, 0.2);
}

void avoid_obstacle_left() {
  go_backward(11, 0.5);
  turn_right(5);
  go_forward(21, 0.5);
  turn_left(18);
  go_forward(60, 0.5);
  turn_left(5);
  go_forward(10, 0.5);
  turn_right(17);
  go_forward(8, 0.2);
}

int main(int argc, char **argv) {
  wb_robot_init();
  
  leftMotor = wb_robot_get_device("left wheel motor");
  rightMotor = wb_robot_get_device("right wheel motor");
  accelerometer = wb_robot_get_device("accelerometer");
  
  wb_motor_set_position(leftMotor, INFINITY);
  wb_motor_set_position(rightMotor, INFINITY);
  wb_motor_set_velocity(leftMotor, 0.0);
  wb_motor_set_velocity(rightMotor, 0.0);
  
  wb_accelerometer_enable(accelerometer, TIME_STEP);
  
  while (wb_robot_step(TIME_STEP) != -1) {
    go_forward(2, 0.8);
    const double *acc_values = wb_accelerometer_get_values(accelerometer);
    printf("acc: %.4f, %.4f, %.4f\n", acc_values[0], acc_values[1], acc_values[2]);
    
    if (acc_values[0] > 0.08) {
      if (rand() % 3 >= 1)
        avoid_obstacle_right();
      else
        avoid_obstacle_left();
    }
  }
  
  wb_robot_cleanup();
  
  return 0;
}
