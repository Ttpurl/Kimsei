import os
import time

# Set the interval for running the commands
interval = 6 * 60 * 60 # 6 hours in seconds

while True:
    # Run the commands
    os.system('apt-get update')
    os.system('apt-get upgrade -y')
    os.system('apt-get autoremove -y')
    os.system('updatedb')

    # Wait for the specified interval before running the commands again
    time.sleep(interval)