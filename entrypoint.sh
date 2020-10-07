#!/bin/bash
set -e

echo "$@" > log.txt

exec "$@"
