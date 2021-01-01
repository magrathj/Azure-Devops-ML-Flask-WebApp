#!/bin/bash

locust -f $1 --headless -u 200 -r 10 --host=$TARGET_HOST --csv="test_$(date +%F_%T)" --run-time 1h -t 2s --stop-timeout 60


exit 0