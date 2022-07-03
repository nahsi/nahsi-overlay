# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="Python library for creating system tray icons"
HOMEPAGE="https://github.com/moses-palmer/pystray"
SRC_URI="
	https://github.com/moses-palmer/pystray/archive/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/python-xlib[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""
