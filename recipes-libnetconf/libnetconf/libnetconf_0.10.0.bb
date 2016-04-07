DESCRIPTION = "libnetconf is a NETCONF library in C intended for building NETCONF clients and servers."
HOMEPAGE = "https://code.google.com/p/libnetconf/"
SECTION = "libs"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://COPYING;md5=22c218798908f95216326c4df42637b5"

SRC_URI = " \
    git://github.com/CESNET/libnetconf.git \
    file://0001-Remove-xml2-config-and-xslt-config-checks.patch \
    file://0002-Makefile-updates.patch \
    file://0003-Fix-datastore-include-path.patch \
    file://0004-Fix-file-include-path.patch \
"

SRCREV="${AUTOREV}"
PR = "r1"

DEPENDS = "libxml2 libxslt libssh openssl curl python"

FILES_${PN} += "${libdir}/${PN}/libnetconf.a"

S = "${WORKDIR}/git"

FILES_${PN} += "/usr/bin"

inherit autotools pkgconfig gettext

EXTRA_OECONF = "libtool=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool" 

