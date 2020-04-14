#!/bin/bash
set -e
BASEDIR=$(dirname "$0")
export XC_IP=${XC_IP:=raspberrypi.local}
export XC_ROOT=${XC_ROOT:="`realpath $BASEDIR/..`"}
export XC_USER=${XC_USER:=pi}
export XC_SSH=${XC_USER}@${XC_IP}

