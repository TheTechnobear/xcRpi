#!/bin/bash
set -e
BASEDIR=$(dirname "$0")
export XC_IP=${XC_IP:=raspberrypi.local}
export XC_ROOT=${XC_ROOT:="`realpath $BASEDIR/..`"}
export XC_SSH=${XC_SSH:=pi@$XC_IP}

cd "$XC_ROOT"

echo copying main libraries- takes a while

rsync -rzLR --safe-links \
      $XC_SSH:/usr/lib/arm-linux-gnueabihf \
      $XC_SSH:/usr/lib/gcc/arm-linux-gnueabihf \
      $XC_SSH:/usr/include \
      $XC_SSH:/lib/arm-linux-gnueabihf \
      sysroot/ 
