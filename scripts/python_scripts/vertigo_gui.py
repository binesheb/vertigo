#!/usr/bin/python
import RPi.GPIO as GPIO
import os, time

#set GPIO Pin#17 as input for shutdown signal
print("Configuring PIN 17 for shutdown")
GPIO.setmode(GPIO.BCM)
GPIO.setup(17, GPIO.IN)
print("Monitoring PIN17 for shutdown trigger")
while True:
    if (GPIO.input(17)==GPIO.LOW):
        os.system("echo Shutdown Sequence Initiated")
        os.system("date")
        os.system("sudo init 0")
    else:
            os.system("echo Normal")
            time.sleep(2);