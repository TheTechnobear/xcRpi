## General 

the installation is very staightforward, and does 


## requirements
supported OS are:
- macOS
- Linux (debian based e.g. deb/ubuntu)

it would be easy to add other linux variants
windows could probably be done using gnu/cygwin tools
however, I dont have the time.... but Im happy to accept pull requests from others :)


see specific requirements below, in addition

- computer (not rpi) must be connected to the internet to download packages
- computer must be connected to rpi

connection to rpi...

the assumption is rpi is connected to your computer, and has a hostname resolving to raspberrypi.local, if not
you must set the XC_IP address according 

e.g. 
```
export XC_IP=raspberrypi.local
```

make sure you can successfully log on to tt with this,
e.g.
```
ssh pi@$XC_IP
```


## password-less logon
you will not want to have to type in the password everytime you want to transfer files etc,
to avoid this we need to set up a trust relationship between your two machines.
do this before install.. as otherwise you will be asked for the password alot ;)

we do this securely with secure keys, 
please read the following about how to create and copy ssh keys

https://www.shellhacks.com/ssh-login-without-password/

after you have it working , you should be able to do ssh, and not be prompted for a password

e.g.
```
ssh pi@$XC_IP
```


## Installing on Mac OS 
get rpi client and scripts
```
cd ~
git clone https://github.com/thetechnobear/xcRpi
cd xcRpi
cd install
./install
```

### information only:
the mac installation uses homebrew to install llvm an some other tools using...
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install arm-linux-gnueabihf-binutils llvm rsync coreutils
```


## Installing on Linux

Note: currently im only supporting debian (using apt), though its trival to change the install scripts for other distros, 
should be simply a matter of replacing apt-get to with pacman or whatever your distro provides
(if make it work on another disto, please send me a PR with changes)


linux is a litte more involved as before we start running the install we must manually configure apt/deb  to pick up packages from them LLVM repository

these are listed here: https://apt.llvm.org/

(we are installing the stable branch of llvm-10)

we need to add to /etc/apt/sources.list , 2 lines 
which depends on the version of ubuntu you are using, e.g. for bionic, we add the following two lines:

```
deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main`
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-10 main `
```

once we have done this we need to add the llvm key, to authorise, and then update apt

```
sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo apt update
```

Now we are ready to do the install :) 

```
cd ~
git clone https://github.com/thetechnobear/xcRpi
cd xcRpi
cd install
./install
```

## information only

what does this install?
basically llvm, clang and binary packages associate with gnueabihf

sudo apt-get install libllvm-10-ocaml-dev libllvm10 llvm-10 llvm-10-dev llvm-10-doc llvm-10-examples llvm-10-runtime
sudo apt-get install clang-10 clang-tools-10 clang-10-doc libclang-common-10-dev libclang-10-dev libclang1-10 clang-format-10
sudo apt-get install binutils-arm-linux-gnueabihf cpp-5-arm-linux-gnueabihf gcc-5-arm-linux-gnueabihf
sudo apt-get install linux-libc-dev-armhf-cross


