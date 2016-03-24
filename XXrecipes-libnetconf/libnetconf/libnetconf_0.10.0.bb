DESCRIPTION = "libnetconf is a NETCONF library in C intended for building NETCONF clients and servers."
HOMEPAGE = "https://code.google.com/p/libnetconf/"
SECTION = "libs"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://COPYING;md5=22c218798908f95216326c4df42637b5"

SRC_URI = " \
    git://code.google.com/p/libnetconf/;protocol=https;branch=master \
"

SRCREV="${AUTOREV}"
PR = "r1"

DEPENDS = "libxml2 libxslt libssh openssl curl"

S = "${WORKDIR}/git"

inherit autotools gettext

EXTRA_OECONF = "libtool=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"

