#!/bin/sh
set -eu

# First arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- sonar-scanner "$@"
fi

exec "$@"
