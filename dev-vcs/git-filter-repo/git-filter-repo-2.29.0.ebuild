# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_7 python3_8 python3_9 )

inherit python-r1

DESCRIPTION="Quickly rewrite git repository history (filter-branch replacement)"
HOMEPAGE="https://github.com/newren/git-filter-repo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${PYTHON_DEPS}
		dev-vcs/git"
