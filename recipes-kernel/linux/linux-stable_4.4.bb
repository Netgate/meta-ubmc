require recipes-kernel/linux/linux-yocto.inc

KERNEL_IMAGETYPE = "zImage"

COMPATIBLE_MACHINE = "beaglebone"

RDEPENDS_kernel-base += "kernel-devicetree"

KERNEL_DEVICETREE_beaglebone = " \
    am335x-ubmc.dtb \
 "

LINUX_VERSION = "4.4"
LINUX_VERSION_EXTENSION = "-jumpnow"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-4.4:"

S = "${WORKDIR}/git"

PR = "r6"

# v4.4.3
SRCREV = "2134d97aa3a7ce38bb51f933f2e20cafde371085"
SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=linux-4.4.y \
    file://defconfig \
    file://0001-spidev-Add-a-generic-compatible-id.patch \
    file://0002-dts-Revoke-Beaglebone-i2c2-definitions.patch \
    file://0003-Add-ft5x06_ts-touchscreen-driver.patch  \
    file://0004-dts-add-uBMC.patch \
 "
