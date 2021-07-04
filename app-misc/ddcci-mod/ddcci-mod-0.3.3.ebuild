# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 dist-kernel-utils linux-mod

DESCRIPTION="A pair of Linux kernel drivers for DDC/CI monitors."
HOMEPAGE="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux"
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_COMMIT="v${PV}"

IUSE="dist-kernel"
LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64"

MODULE_NAMES="ddcci(extra:${S}/ddcci:${S}/ddcci) ddcci-backlight(extra:${S}/ddcci-backlight:${S}/ddcci-backlight)"

pkg_pretend() {
	if has_version virtual/dist-kernel && ! use dist-kernel; then
		ewarn "You have virtual/dist-kernel installed, but"
		ewarn "USE=\"dist-kernel\" is not enabled for ${CATEGORY}/${PN}"
		ewarn "It's recommended to globally enable dist-kernel USE flag"
		ewarn "to auto-trigger initrd rebuilds with kernel updates"
	fi

	CONFIG_CHECK="~I2C_CHARDEV"
	ERROR_I2C_CHARDEV="You must enable I2C_CHARDEV in your kernel to continue"
}

pkg_setup() {
	linux-mod_pkg_setup
}

src_install() {
	set_arch_to_kernel
	linux-mod_src_install
}

pkg_postinst() {
	linux-mod_pkg_postinst

	if use dist-kernel; then
		set_arch_to_portage
		dist-kernel_reinstall_initramfs "${KV_DIR}" "${KV_FULL}"
	fi
}
