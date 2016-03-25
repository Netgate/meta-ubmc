DESCRIPTION = "libnetconf is a NETCONF library in C intended for building NETCONF clients and servers."
HOMEPAGE = "https://code.google.com/p/libnetconf/"
SECTION = "libs"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://COPYING;md5=22c218798908f95216326c4df42637b5"

SRC_URI = " \
    git://code.google.com/p/libnetconf/;protocol=https;branch=master \
    file://0001-Remove-xml2-config-and-xslt-config-checks.patch \
    file://0002-Makefile-updates.patch \
"

SRCREV="${AUTOREV}"
PR = "r1"

DEPENDS = "libxml2 libxslt libssh openssl curl"

S = "${WORKDIR}/git"

inherit autotools pkgconfig gettext

EXTRA_OECONF = "libtool=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool \
		--libdir=/home/sbeaver/ubmc/build/tmp/sysroots/beaglebone/usr/lib \ 
		--includedir=/home/sbeaver/ubmc/build/tmp/sysroots/beaglebone/usr/include" 

