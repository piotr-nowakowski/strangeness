#!/bin/bash
set -e

echo "$@" > /tmp/log.txt

exec "$@"
