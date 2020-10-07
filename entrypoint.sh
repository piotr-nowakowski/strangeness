#!/bin/bash
set -e

#echo "$@" > /tmp/log.txt
#echo "${@:2}" > /tmp/log2.txt
root --notebook "${@:2}" --notebook-dir=/home/jovyan/

#exec "$@"
