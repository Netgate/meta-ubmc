This layer depends on:

    URI: git://git.yoctoproject.org/poky.git
    branch: jethro 
    revision: HEAD
    commit: b1f23d1

    meta-ubmc layer maintainer: Steve Beaver <sbeaver@netgate.com>

This layer was created using the Beaglebone-black layer developed by Jumpnow Technologies LLC as a reference. http://www.jumpnowtek.com/

Major Software Versions

* Yocto 2.0.1 [jethro] branch
* Linux kernel 4.4.3 (linux-stable)
* U-Boot 2016.01

## Building Linux for the uBMC

The uBMC Linux kernel and root file system are produced by the Yocto project build system. https://www.yoctoproject.org/ along with a custom uBMC Board Support Package (BSP) layer named meta-ubmc

If you follow the instructions that follow carefully, it should be possible to create a complete working system from a single shell command.
Preparing the build system

On a Linux system (Ubuntu, CentOS, Fedora or Debian are recommended) ensure that the following packages are installed:

    bc
    build-essential
    chrpath
    diffstat
    gawk
    git
    libncurses5-dev
    pkg-config
    subversion
    texi2html
    texinfo
    u-boot-tools

### Downloading the build environment and layers

From your home directory, create a ubmc and a build directory:

  ~/$ mkdir -p ubmc/build

If you are using Ubuntu, change the default shell to Bash by typing "sudo dpkg-reconfigure dash" and selecting "No" from the menu displayed.

From your home directory obtain and install a copy of the Yocto build system and some required layers:

    ~/$ git clone -b jethro git://git.yoctoproject.org/poky.git poky-jethro
    ~/$ cd poky-jethro
    ~/poky-jeth$ git clone -b jethro git://git.openembedded.org/meta-openembedded
    ~/poky-jetho$ git clone -b jethro https://github.com/meta-qt5/meta-qt5.git

Change directories to your ~/ubmcdirectory, and git clone THIS PROJECT (github.com.com/netgate/meta-ubmc)

Unpack it using tar xvzf meta-ubmc.tar.gz You should now have a directory structure like this:

  Home
     |
     |--ubmc
     |   |
     |   --build
     |   --meta-ubmc
     |
     |--poky-jethro


### Preparing the build system

Prepare the build system by using the Yocto scripts to set up your directory tree and environment variables. From your home directory:

    ~/$ source poky-jethro/oe-init-build-env ~/ubmc/build

Now we need to copy some sample configuration files from the ubmc layer. From the ~/ubmc directory:

    ~/ubmc$ cp meta-ubmc/conf/local.conf-sample build/conf/local.conf
    ~/ubmc$ cp meta-ubmc/conf/bblayers.conf-sample build/conf/bblayers.conf

If you have used the directory names specified in this document, it will not be necessary to edit these files. Now we need to set up the environment for Yocto using another script. From your home directory: ~/$ source poky-jethro/oe-init-build-env ~/ubmc/build
Building the build

Now that everything is set up, actually building the code is pretty simple. From your ~/ubmc/build direcory, simply type the Yocto bitbake command:

    ~/ubmc/build$ bitbake console-image

and go find something else to do. The system has to download the source code and tools for an entire operating system, build the cross tools, unpack and build several hundred packages and then build a root file system from those. Expect it to take at least 90 minutes the first time you run it. Once the system has been built once, it should only take a few minutes to re-build it after any changes.
Deploying the resulting images to a uBMC

The output of the Yocto build system is a compressed root file system which is to be found here:

    ~/ubmc/build/tmp/deployimages/beaglebone/console-image-beaglebone-<date-time>.rootfs.tar.xz

Copy this file to the uBMC eMMC memory (see below), un-tar it then remove the archive Your system should b=now be ready to run.


The uBMC should now boot from the Yocto/uBMC image.

COnfigure hte boot loader to load the kernel from /boot/zImage and the device tree from /boot/ubmc.dtb. THe root file system should be specified in the boodcmd string as: "root=/dev/mmcblk0p1 rw" (Without the quotes)

Details on preparing the uBMC to recive the Yocto built image are available on request from infor@netgate.com

    Sending discover...
    Sending select for 172.21.2.41...
    Lease of 172.21.2.41 obtained, lease time 7200
    /etc/udhcpc.d/50default: Adding DNS 172.21.2.1
    done.
    Starting system message bus: dbus.
    random: nonblocking pool is initialized
    Starting OpenBSD Secure Shell server: sshd
    done.
    Starting ntpd: done
    Starting syslogd/klogd: done

    Poky (Yocto Project uBMC) 2.0.1 micro-BMC


                _                      ____  __  __  _____
               (_)                    |  _ \|  \/  |/ ____|
      _ __ ___  _  ___ _ __ ___ ______| |_) | \  / | |
     |  _   _ \| |/ __| __/  _  \_____|  _ <| |\/| | |
     | | | | | | | (__| | | (_) |     | |_) | |  | | |____
     |_| |_| |_|_|\___|_|  \___/      |____/|_|  |_|\_____|
    
    
    micro-BMC login:
