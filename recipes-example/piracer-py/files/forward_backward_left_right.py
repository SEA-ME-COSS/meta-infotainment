# Copyright (C) 2022 twyleg
import time
from piracer.vehicles import PiRacerStandard, PiRacerPro


if __name__ == '__main__':

    # piracer = PiRacerPro()
    piracer = PiRacerStandard()

    # Forward
    piracer.set_throttle_percent(0.2)
    time.sleep(2.0)

    # Brake
    piracer.set_throttle_percent(-1.0)
    time.sleep(0.5)
    piracer.set_throttle_percent(0.0)
    time.sleep(0.1)

    # Backward
    piracer.set_throttle_percent(-0.3)
    time.sleep(2.0)

    # Stop
    piracer.set_throttle_percent(0.0)

    # Steering left
    piracer.set_steering_percent(1.0)
    time.sleep(1.0)

    # Steering right
    piracer.set_steering_percent(-1.0)
    time.sleep(1.0)

    # Steering neutral
    piracer.set_steering_percent(0.0)
