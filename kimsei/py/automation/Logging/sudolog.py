import os
import re
import time
import inotify.adapters

# The path to the system log file
log_path = '/var/log/syslog'

# The pattern to search for in the log file
pattern = re.compile(r'sudo')

# The path to the log file where sudo commands will be recorded
output_path = '~/sudolog.txt'

# Create an inotify watcher for the log file
notifier = inotify.adapters.Inotify()

notifier.add_watch(log_path)

# Continuously monitor the log file for changes
while True:
    for event in notifier.event_gen():
        if event is not None:
            # Extract the file path and event type from the event
            (header, type_names, watch_path, filename) = event

            # If the event is a modification of the log file
            if 'IN_MODIFY' in type_names and filename == 'syslog':
                # Read the new lines that were added to the log file
                with open(log_path, 'r') as f:
                    f.seek(0, os.SEEK_END)
                    while True:
                        line = f.readline()
                        if not line:
                            break
                        # If the line contains the keyword "sudo", write it to the output file
                        if pattern.search(line):
                            with open(output_path, 'a') as outfile:
                                outfile.write(line)
                                outfile.write('\n')
    # Wait for a short time before checking for new events
    time.sleep(1)