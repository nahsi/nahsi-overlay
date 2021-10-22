# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An open source edge and service proxy"
HOMEPAGE="https://www.envoyproxy.io/"
SRC_URI="https://archive.tetratelabs.io/envoy/download/v${PV}/envoy-v${PV}-linux-${ARCH}.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/envoy-v${PV}-linux-${ARCH}"

src_install() {
	dobin bin/envoy
}
