from controller import Robot, DistanceSensor, Motor
import logging
import random

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# time in [ms] of a simulation step
TIME_STEP = 64
MAX_SPEED = 6.28

# create the Robot instance.
robot = Robot()

leftMotor = robot.getDevice('left wheel motor')
rightMotor = robot.getDevice('right wheel motor')

accelerometer = robot.getDevice('accelerometer')
accelerometer.enable(TIME_STEP)

leftMotor.setPosition(float('inf'))
rightMotor.setPosition(float('inf'))
leftMotor.setVelocity(0.0)
rightMotor.setVelocity(0.0)


def turn_left(steps=15) -> None:
    """
    Spining robot left for thr given number of steps
    """
    while steps:
        leftMotor.setVelocity(-0.5 * MAX_SPEED)
        rightMotor.setVelocity(0.5 * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
        
def turn_right(steps=15) -> None:
    """
    Spining robot right for thr given number of steps
    """
    while steps:
        leftMotor.setVelocity(0.5 * MAX_SPEED)
        rightMotor.setVelocity(-0.5 * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
        
def go_forward(steps=12, v=0.5) -> None:
    """
    Going forwards for the given number of steps
    """
    while steps:
        leftMotor.setVelocity(v * MAX_SPEED)
        rightMotor.setVelocity(v * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
  
def go_backward(steps=8, v=0.5) -> None:
    """
    Going backwards for the given number of steps
    """
    while steps:
        leftMotor.setVelocity(-v * MAX_SPEED)
        rightMotor.setVelocity(-v * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
 
    
def avoid_obstacle_right() -> None:
    """
    Fucntion pushes the object to the right side of the obstacle
    """
    # get the object
    go_backward(steps=11)
    turn_left(steps=5)
    go_forward(steps=21)
    turn_right(steps=18)
    # push it away the obstacle
    go_forward(steps=60)
    # get the object
    turn_right(steps=5)
    go_forward(steps=10)
    turn_left(steps=17)
    # keep pushing forward in the original direction
    go_forward(steps=12, v=0.2)


def avoid_obstacle_left() -> None:
    """
    Function pushes the object to the left side of the obstacle
    """
    # get the object
    go_backward(steps=11)
    turn_right(steps=5)
    go_forward(steps=21)
    turn_left(steps=18)
    # push it away the obstacle
    go_forward(steps=60)
    # get the object
    turn_left(steps=5)
    go_forward(steps=10)
    turn_right(steps=17)
    # keep pushing forward in the original direction
    go_forward(steps=8, v=0.2)


# feedback loop: step simulation until receiving an exit event
while robot.step(TIME_STEP) != -1:
    go_forward(2, v=0.9)
    acc_values = accelerometer.getValues()
    if acc_values[0] > 0.08:
        if random.randint(0, 2) >= 1:
            avoid_obstacle_right()
        else:
            avoid_obstacle_left()
