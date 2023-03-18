#!/bin/bash

# generate non null files and send these to 2nd VM and safe 7 days

base64 /dev/urandom | head -c 100000 > /tmp/files{1..3} 
rsync -av --progress /tmp/files{1..3} root@devops2:/tmp/ | find -type f -mtime +7 exec -rf {} \; 