# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Tool to control the brightness of backlight and LED devices on Linux."
HOMEPAGE="https://gitlab.com/cameronnemo/brillo"
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_COMMIT="v${PV}"

KEYWORDS="~amd64"
LICENSE="GPL-3 BSD"
SLOT="0"
IUSE="+ddcci"

DEPEND="
	virtual/udev
	ddcci? ( app-misc/ddcci-mod )
"

BDEPEND="
	dev-go/go-md2man
"

src_install() {
	emake UDEVRULESDIR="/lib/udev/rules.d/" DESTDIR="${D}" install
}
