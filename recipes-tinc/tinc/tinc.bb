SECTION = "console/network"
DESCRIPTION ="tinc is a Virtual Private Network (VPN) daemon"
HOMEPAGE = "http://www.tinc-vpn.org/"
LICENSE = "GPLv2"
PR = "r2"

SRC_URI="file://tinc.tar.gz \
         file://config.h \
        "

DEPENDS = "openssl lzo zlib"
RRECOMMENDS_${PN} = "kernel-module-tun"

LIC_FILES_CHKSUM = "file://COPYING;md5=484c42304943a26b6d93144f89a2636c"

S = "${WORKDIR}/tinc"

inherit autotools

EXTRA_OECONF = "--disable-maintainer-mode"

do_configure() {
	oe_runconf
}

do_fixsource() {
	cp "${THISDIR}"/files/config.h "${B}"
	sed -i 's/SUBDIRS = m4 src doc/SUBDIRS = m4 src/' "${B}"/Makefile
}

do_compile() {
	oe_runmake
}

do_install() {
        oe_runmake install DESTDIR=${D}
}

addtask fixsource before do_compile after do_configure

SRC_URI[md5sum] = "a8c168227fa42cbfcd4983247bf609ca"
SRC_URI[sha256sum] = "2b4319ddb3bd2867e72532a233f640a58c2f4d83f1088183ae544b268646ba21"
