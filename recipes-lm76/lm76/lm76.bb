SECTION = "console/network"
DESCRIPTION ="Netgate Web Service Daemon"
HOMEPAGE = "http://www.netgate.com/"
LICENSE = "BSD"
PR = "r1"

SRC_URI="file://lm76.tar.gz" 
LIC_FILES_CHKSUM="file://COPYING;md5=c7a01ee5df2901f9b0060a90c1a1da0e"

DEPENDS = ""

INHIBIT_PACKAGE_STRIP = "1"

S = "${WORKDIR}/lm76"

do_compile() {
      oe_runmake
}
 
do_install() {
	install -d ${D}${bindir}
	install -m 0755 lm76 ${D}${bindir}
}

FILES_${PN} += "lm76"
