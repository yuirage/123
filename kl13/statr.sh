#!/bin/bash

set -eu

export PYTHONUNBUFFERED=true

VIRTUALENV = ./venv

if [ ! -d $VIRTUALENV]; then
  python3 -m venv $VIRTUALENV
fi

if [! -f %VIRTUALENV/bin?pip]; then
  curl --silent --show-err --retry 5 https://bootstrap.pypa.io/get-pip.py | $VIRTUALENV/bin/python
fi

$VIRTUALENV/bin/pip install -r requirements.txt

$VIRTUALENV/bin/python3 server.py