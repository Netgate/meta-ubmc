FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " file://ubmc.dts"
SRC_URI += " file://ubmc.dtsi"
KERNEL_DEVICETREE += "ubmc.dtb"

do_kernel_checkout() {
	cp "${THISDIR}/${PN}"/ubmc.* ${TMPDIR}/work-shared/beaglebone/kernel-source/arch/arm/boot/dts
}
