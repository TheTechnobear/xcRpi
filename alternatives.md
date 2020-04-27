#Using xcRpi for alternatives distributions


xcRpi is just a collection of standard tools with scripts :) 

in building these scripts, Ive tried to ensure that specifics can be overridden easily,
as things like hostname, file locations, usernames can be different for different platforms


so if your not using raspbian there are 3 things you will want to override.

## Override variables

XC_IP = hostname or ip of your target machine, default :  `raspberrypi.local`
XC_ROOT = where does xcRpi live, default : `~/xcRPI`
XC_USER= user used to log into target machine, default `pi@` 

## using for multiple targets

lets imagine you have a rPI and an organelle which you want to do cross-platform development
could you use the same install of xcRpi for both?

the answer is maybe, but its probably not a good idea!
instead what you should do is install a separate copy for each 'target', 
you can do this by adding the new directory name to the end of git clone
e.g.

```
cd ~
git clone https://github.com/thetechnobear/xcRpi xcOrganelleM
cd ~/xcOrganelleM
```

see, how git clone, created the directory as xcOrganelleM now, rather than xcRpi

(note: dont just copy the xcRpi directory, as you dont want the sysroot from the previous install - see below)

Why?
the issue is not with the scripts... but rather sysroot
when you run install, we copy system files from your target machine - so that when you compile, you compile against headers and libraries for that machine.
so if you install from a raspberryPI  , these headers and libraries **may** not match your organelle version, 
so whilst it will cross-compile happily, when you transfer the file to the organelle it will not run, as it may be missing libraries, or have incorrect versions of libraries.


##known issues
currently I use `~/.xcRpi.config` to default varirables for all, 
this is hard to overcome due to nature of the way we use `xcSetVar`,
this doesnt however come into play, if you export vars as recommended below. 


# Examples
some alternatives I use (or plan to ;) ) 

In all cases setting XC_ROOT is optional, only really required if you use multiple platforms

## Norns
```
export XC_IP=norns.local
export XC_ROOT=~/xcNorns
export XC_USER=we
```

## Terminal Tedium
my TT is based off of a norns build, but with a different hostname
```
export XC_IP=tt.local
export XC_ROOT=~/xcTT
export XC_USER=we
```

## QuBit Nebulae 2
untested, but I believe should work

```
export XC_IP=alarmpi.local
export XC_ROOT=~/xcNeb2
export XC_USER=alarm
```

## Organelle-M
untested, but I believe should work

note: I do not think organelle-1 will work, but is untested
```
export XC_IP=organellem.local
export XC_ROOT=~/xcOrganelleM
export XC_USER=music
```



