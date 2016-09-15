DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
for the development of SOAP Web Services and clients."
SECTION = "devel"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d52bd9e6bfca4643549a04f6716a9e32"

SRC_URI = "file://gsoap_2.8.30.zip \
"

inherit autotools

PR = "r1"

S = "${WORKDIR}/gsoap-2.8"

FILES_${PN}-dev = "${includedir}"
RRECOMMENDS_${PN}-dev = "${PN}-staticdev"

FILES_${PN}-staticdev = "${libdir}"

PARALLEL_MAKE = ""

EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"

