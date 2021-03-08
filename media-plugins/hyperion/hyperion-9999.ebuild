# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake systemd

DESCRIPTION="An  open source ambient light software"
HOMEPAGE="https://hyperion-project.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/hyperion-project/${PN}.ng"
EGIT_SUBMODULES=()

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="cec +spi tinkerforge +qt-grabber +usb +v4l +xcb +zeroconf"

DEPEND="
	dev-lang/python
	dev-libs/protobuf
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtserialport:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qtx11extras:5
	dev-libs/flatbuffers
	dev-util/cmake
	net-libs/mbedtls
	dev-libs/openssl
	sys-libs/zlib
	sys-apps/dbus
	v4l? ( virtual/jpeg )
	zeroconf? ( net-dns/avahi[mdnsresponder-compat] )
	cec? ( dev-libs/libcec )
	xcb? (
		x11-libs/xcb-util-image
		x11-libs/libxcb
		x11-libs/xcb-util
		x11-libs/xcb-util-renderutil
		x11-libs/libXrandr
		x11-libs/libXrender
	)
	usb? ( virtual/libusb )
"
RDEPEND="
	acct-group/hyperion
	acct-user/hyperion
	${DEPEND}
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DPLATFORM=x11
		-DBUILD_SHARED_LIBS=off
		-DENABLE_AMLOGIC=off
		-DENABLE_OSX=off
		-DENABLE_X11=on
		-DENABLE_EXPERIMENTAL=off
		-DENABLE_DISPMANX=off # rpi lib
		-DENABLE_DX=off # DirectX
		-DENABLE_PROFILER=off # DirectX
		-DENABLE_WS281XPWM=off # rpi lib
		-DENABLE_FB=on
		-DENABLE_QT=$(usex qt-grabber)
		-DENABLE_TINKERFORGE=$(usex tinkerforge)
		-DENABLE_XCB=$(usex xcb)
		-DENABLE_AVAHI=$(usex zeroconf)
		-DENABLE_CEC="$(usex cec)"
		-DENABLE_SPIDEV="$(usex spi)"
		-DENABLE_USB_HID="$(usex usb)"
		-DENABLE_V4L2="$(usex v4l)"
		-DUSE_SYSTEM_PROTO_LIBS=on
		-DUSE_SYSTEM_FLATBUFFERS_LIBS=on
		-DUSE_SYSTEM_MBEDTLS_LIBS=on
		-Wno-dev
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	insinto /etc/${PN}
	doins "${S}/config/hyperion.config.json.default"
	doins "${S}/config/hyperion.config.json.commented"
	ewarn "An example config file is provided in /etc/hyperion."
	ewarn "To allow access to certain input devices you have add the hyperion"
	ewarn "user to the uucp group: usermod -G uucp hyperion"

	keepdir /var/lib/${PN}
	fowners ${PN}:${PN} /var/lib/${PN}
	fperms 0755 /var/lib/${PN}

	keepdir /etc/${PN}
	fowners ${PN}:${PN} /etc/${PN}
	fperms 0755 /etc/${PN}

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	systemd_newunit "${S}/bin/service/hyperion.systemd" hyperion.service
}
