#!/bin/bash
set -e

echo "$@" > /opt/log.txt

exec "$@"
