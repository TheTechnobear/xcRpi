#!/bin/bash
BASEDIR=$(dirname "$0")
export XC_IP=${XC_IP:=tt.local}
export XC_ROOT=${XC_ROOT:="`realpath $BASEDIR/..`"}
export XC_SSH=we@$XC_IP

cd "$XC_ROOT"

echo copying main libraries- takes a while

rsync -rzLR --safe-links \
      $XC_SSH:/usr/lib/arm-linux-gnueabihf \
      $XC_SSH:/usr/lib/gcc/arm-linux-gnueabihf \
      $XC_SSH:/usr/include \
      $XC_SSH:/lib/arm-linux-gnueabihf \
      sysroot/ 

mkdir -p ./sysroot/usr/local/lib
mkdir -p ./sysroot/usr/local/include


#additional
#alsa
#mkdir -p ./sysroot/usr/include/alsa
#rsync -avz $XC_SSH:/usr/include/alsa ./sysroot/usr/include