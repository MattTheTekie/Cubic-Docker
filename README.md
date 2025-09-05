# Cubic-Docker

<img src="screenshots/cubic_512x512.png" height="128"/>

**[Cubic](https://github.com/PJ-Singh-001/Cubic) is a GUI wizard to create a customized Live ISO image for Ubuntu and Debian based distributions.**

Cubic permits effortless navigation through the ISO customization steps and features an integrated virtual command line environment to customize the Linux file system. You can create new customization projects or modify existing projects. Important parameters are dynamically populated with intelligent defaults to simplify the customization process.

Cubic runs on distributions based on:
- Ubuntu 18.04.5 Bionic Beaver and above
- Debian 11 Bullseye and above

Cubic can be used to customize the Live ISOs for:
- All versions of Ubuntu from 14.04 Trusty Tahr and above
- Most distributions based on Ubuntu
- Many versions of Debian (tested on Debian 11 Bullseye and above)
- Many distributions based on Debian
- 
## Running Via Docker
Must be in the same directory as the Dockerfile.
(This is still being tested and cannot promise it will work feel free to help and contribute)

    sudo docker build --network=host -t cubic:dev .
    sudo docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home:/home/cubic cubic:dev
