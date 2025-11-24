#!/bin/bash
# simple mysqlslap load example
MYSQL_USER=${1:-wp}
MYSQL_PASS=${2:-wppass}
MYSQL_DB=${3:-wordpress}

mysqlslap --user=$MYSQL_USER --password=$MYSQL_PASS --host=127.0.0.1 --concurrency=50 --iterations=10 --query="SELECT SLEEP(0.05)" --create-schema=$MYSQL_DB
