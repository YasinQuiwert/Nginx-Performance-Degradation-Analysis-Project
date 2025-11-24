#!/bin/bash
# usage: ./run-wrk.sh http://DEVOPS_IP/ 60 4 200
URL=${1:-http://DEVOPS_IP/}
DURATION=${2:-60}
THREADS=${3:-4}
CONNS=${4:-200}

wrk -t${THREADS} -c${CONNS} -d${DURATION}s --latency $URL
