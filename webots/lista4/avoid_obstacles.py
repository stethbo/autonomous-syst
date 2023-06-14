from controller import Robot, DistanceSensor, Motor
import logging
import time

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# time in [ms] of a simulation step
TIME_STEP = 64

MAX_SPEED = 6.28

# create the Robot instance.
robot = Robot()

# initialize devices
ps = []
psNames = [
    'ps0', 'ps1', 'ps2', 'ps3',
    'ps4', 'ps5', 'ps6', 'ps7'
]

for i, name in enumerate(psNames):
    ps.append(robot.getDevice(name))
    ps[i].enable(TIME_STEP)

leftMotor = robot.getDevice('left wheel motor')
rightMotor = robot.getDevice('right wheel motor')
accelerometer = robot.getDevice('accelerometer')
accelerometer.enable(TIME_STEP)

leftMotor.setPosition(float('inf'))
rightMotor.setPosition(float('inf'))
leftMotor.setVelocity(0.0)
rightMotor.setVelocity(0.0)


def turn_left(steps=15):
    logger.info('Turning left...')
    while steps:
        leftMotor.setVelocity(-0.5 * MAX_SPEED)
        rightMotor.setVelocity(0.5 * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
        
def turn_right(steps=15):
    logger.info("Turning right..")
    while steps:
        leftMotor.setVelocity(0.5 * MAX_SPEED)
        rightMotor.setVelocity(-0.5 * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
        
def go_forward(steps=12, v=0.5, watch: str=None):
    logger.info("Going straight...")
    while steps:
        leftMotor.setVelocity(v * MAX_SPEED)
        rightMotor.setVelocity(v * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
  
def go_backward(steps=8, v=0.5):
    logger.info("Going straight...")
    while steps:
        leftMotor.setVelocity(-v * MAX_SPEED)
        rightMotor.setVelocity(-v * MAX_SPEED)
        robot.step(TIME_STEP)
        steps -= 1
 
    
def avoid_obstacle():
    # get the object
    go_backward(steps=11)
    turn_left(steps=5)
    go_forward(steps=21)
    turn_right(steps=18)
    # push it away the obstacle
    go_forward(steps=58, watch='L')
    # get the object
    turn_right(steps=5)
    go_forward(steps=10)
    turn_left(steps=17)
    go_forward(steps=6, v=0.3)




# feedback loop: step simulation until receiving an exit event
while robot.step(TIME_STEP) != -1:
    # read sensors outputs
    psValues = []
    for i in range(8):
        psValues.append(ps[i].getValue())
    go_forward(2, v=0.8)

    # read accelerometer        
    acc_values = accelerometer.getValues()
    logger.info(f'acc: {round(acc_values[0], 4), round(acc_values[1], 4), round(acc_values[2], 4)}')
    if acc_values[0] > 0.08:
        logger.info("HIT DETECTED")
        avoid_obstacle()
              