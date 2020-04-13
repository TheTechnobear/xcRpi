#!/bin/bash
set -e
BASEDIR=$(dirname "$0")
export XC_IP=${XC_IP:=raspberrypi.local}
export XC_ROOT=${XC_ROOT:="`realpath $BASEDIR/..`"}
export XC_SSH=${XC_SSH:=pi@$XC_IP}

