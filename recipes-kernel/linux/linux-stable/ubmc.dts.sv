/*-
 * Copyright (c) 2016 Luiz Otavio O Souza <loos@freebsd.org>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * 
 * $FreeBSD$
 */

/dts-v1/;

#include "am33xx.dtsi"
#include "ubmc.dtsi"

/ {
	model = "AM335x uBMC";
	compatible = "ti,am335x-bone", "ti,am33xx";
};

&mmc1 {
	status = "okay";
};

&mmc2 {
	vmmc-supply = <&vmmcsd_fixed>;
	pinctrl-names = "default";
	pinctrl-0 = <&emmc_pins>;
	bus-width = <8>;
	ti,dual-volt;
	non-removable;
	status = "okay";
};

&am33xx_pinmux {
	i2c1_pins: pinmux_i2c1_pins {
		pinctrl-single,pins = <
			0x168 (PIN_INPUT_PULLUP | MUX_MODE3)	/* uart0_ctsn.i2c1_sda */
			0x16c (PIN_INPUT_PULLUP | MUX_MODE3)	/* uart0_rtsn.i2c1_scl */
		>;
	};
};

&i2c0 {
	pinctrl-names = "default";
	pinctrl-0 = <&i2c0_pins>;

	status = "okay";

	lm750 {
		compatible = "national,lm75";
		i2c-address = <0x48>;
	};

	eeprom0 {
		compatible = "atmel,24c256";
		i2c-address = <0x50>;
	};
};

&i2c1 {
	pinctrl-names = "default";
	pinctrl-0 = <&i2c1_pins>;

	status = "okay";

	eeprom1 {
		compatible = "atmel,24c256";
		i2c-address = <0x50>;
	};
};

&epwmss1 {
	status = "okay";
};

&ecap1 {
	status = "okay";
};

&ehrpwm1 {
	status = "okay";
};

&epwmss2 {
	status = "okay";
};

&ecap2 {
	status = "okay";
};

&ehrpwm2 {
	status = "okay";
};
