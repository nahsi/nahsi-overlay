# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ansi_term-0.11.0
	arrayref-0.3.6
	arrayvec-0.5.2
	atty-0.2.14
	autocfg-1.0.1
	base64-0.13.0
	bencher-0.1.5
	bitflags-1.3.2
	blake2b_simd-0.5.11
	block-0.1.6
	bumpalo-3.7.0
	bytes-1.1.0
	cc-1.0.70
	cfg-if-1.0.0
	chrono-0.4.19
	clap-2.33.3
	constant_time_eq-0.1.5
	core-foundation-0.9.1
	core-foundation-sys-0.8.2
	crossbeam-utils-0.8.5
	dbus-0.6.5
	dirs-1.0.5
	dirs-3.0.2
	dirs-sys-0.3.6
	dtoa-0.4.8
	env_logger-0.8.4
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	futures-core-0.3.17
	futures-task-0.3.17
	futures-util-0.3.17
	getrandom-0.1.16
	getrandom-0.2.3
	hashbrown-0.11.2
	hermit-abi-0.1.19
	indexmap-1.7.0
	js-sys-0.3.55
	lazy_static-1.4.0
	libc-0.2.102
	libdbus-sys-0.2.1
	linked-hash-map-0.5.4
	log-0.4.14
	mac-notification-sys-0.3.0
	malloc_buf-0.0.6
	memchr-2.4.1
	mio-0.7.13
	miow-0.3.7
	native-tls-0.2.8
	nix-0.19.1
	notify-rust-3.6.3
	ntapi-0.3.6
	num-integer-0.1.44
	num-traits-0.2.14
	numtoa-0.1.0
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	once_cell-1.8.0
	openssl-0.10.36
	openssl-probe-0.1.4
	openssl-sys-0.9.66
	pin-project-lite-0.2.7
	pin-utils-0.1.0
	pkg-config-0.3.19
	ppv-lite86-0.2.10
	proc-macro2-1.0.29
	quote-1.0.9
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	redox_syscall-0.1.57
	redox_syscall-0.2.10
	redox_termios-0.1.2
	redox_users-0.3.5
	redox_users-0.4.0
	remove_dir_all-0.5.3
	ring-0.16.20
	rust-argon2-0.8.3
	rustc_tools_util-0.2.0
	rustls-0.19.1
	rustls-native-certs-0.5.0
	schannel-0.1.19
	sct-0.6.1
	security-framework-2.4.2
	security-framework-sys-2.4.2
	serde-1.0.130
	serde_derive-1.0.130
	serde_yaml-0.8.21
	signal-hook-registry-1.4.0
	spin-0.5.2
	strsim-0.8.0
	syn-1.0.76
	tempfile-3.2.0
	termion-1.5.6
	textwrap-0.11.0
	time-0.1.43
	tokio-1.11.0
	tokio-macros-1.3.0
	tokio-native-tls-0.3.0
	tokio-rustls-0.22.0
	tokio-stream-0.1.7
	unicode-width-0.1.8
	unicode-xid-0.2.2
	untrusted-0.7.1
	vcpkg-0.2.15
	vec_map-0.8.2
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.2+wasi-snapshot-preview1
	wasm-bindgen-0.2.78
	wasm-bindgen-backend-0.2.78
	wasm-bindgen-macro-0.2.78
	wasm-bindgen-macro-support-0.2.78
	wasm-bindgen-shared-0.2.78
	web-sys-0.3.55
	webpki-0.21.4
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	yaml-rust-0.4.5
"

inherit cargo

DESCRIPTION="IRC client written in Rust"
HOMEPAGE="https://github.com/osa1/tiny"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"

LICENSE="MIT BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_install() {
	cargo_src_install --path ${S}/crates/tiny
}
