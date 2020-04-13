## goals

This project provides a simple to install and use cross compiler environment, 


- simple installation of cross compiling environment
e.g ./install.sh

- easy to workflow with target board
e.g xcCompileRun render.cpp

- support for cmake, with cmake toolchain

- use modern tools
clang-10, llvm, cmake


## requirements
supported OS are:
- macOS
- Linux (debian based e.g. deb/ubuntu)

it would be easy to add other linux variants
windows could probably be done using gnu/cygwin tools
however, I dont have the time.... but Im happy to accept pull requests from others :)



## installation
see [install.md](https://github.com/TheTechnobear/xcRpi/blob/master/install.md)


## usage

installs and runs by default using 
location: `~/xcRpi`
rpi hostname : `raspberrypi.local` 

you can override with environment variables, if using a different rpi, or scripts placed somewhere else
e.g.

```
export XC_IP=raspberrypi.local
export XC_ROOT=~/projects/xcRpi
```

note: when these are stored in `~/.xcRpi.config`, by install.sh, and xcSetEnv, so only need to be done once, or if you are changing target etc.

## setup environment
```
. $XC_ROOT/xcSetEnv
```
usage note: . (dot) - do **not** run as a script directly 


## using on alternative platforms
you can use this on most rpi systems that are using debian as a base
e.g Norns, Terminal Tedium (norns), and patchbox OS
please see [alternatives.md](https://github.com/TheTechnobear/xcRpi/blob/master/alternatives.md)


## commands
xcExec remotecmd - execute command on remote 
xcCopy localfile remotefile - copy local file to remote 
xcCompile patch.cpp - compile single c++ file
xcRun  patch - run (local executable) patch on remote
xcCompileRun patch.cpp  - compile local file and run on remote

## using with cmake
included in this project is a template which can be used as a cmake toolchain, 
see [cmakefaq.md](https://github.com/TheTechnobear/xcRpi/blob/master/cmake/cmakefaq.md)



## Credits & Resources

article on cross-compiling on mac 
https://medium.com/@haraldfernengel/cross-compiling-c-c-from-macos-to-raspberry-pi-in-2-easy-steps-23f391a8c63