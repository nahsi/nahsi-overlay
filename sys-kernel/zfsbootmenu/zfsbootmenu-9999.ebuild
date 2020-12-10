# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Dracut module that intends to provide Linux distributions with an experience similar to FreeBSD's bootloader"
HOMEPAGE="https://zfsbootmenu.org"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/zbm-dev/${PN}"
else
	SRC_URI="https://github.com/zbm-dev/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="
	>=sys-kernel/dracut-0.5.0
	>=sys-fs/zfs-2.0.0
	app-shells/fzf
	sys-apps/kexec-tools
	sys-block/mbuffer
	dev-perl/Config-IniFiles
	dev-perl/YAML-PP
"
