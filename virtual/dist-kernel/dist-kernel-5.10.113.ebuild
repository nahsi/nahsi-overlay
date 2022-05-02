# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Virtual to depend on any Distribution Kernel"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/${PV}"
KEYWORDS="~amd64"

RDEPEND="
	|| (
		~sys-kernel/nahsi-kernel-${PV}
	)"
