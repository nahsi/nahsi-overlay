# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
	ansi_term-0.11.0
	anyhow-1.0.40
	atty-0.2.14
	bitflags-1.2.1
	cfg-if-1.0.0
	clap-2.33.3
	either-1.6.1
	heck-0.3.2
	hermit-abi-0.1.18
	itertools-0.10.0
	lazy_static-1.4.0
	libc-0.2.88
	pest-2.1.3
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.26
	quote-1.0.9
	rstest-0.9.0
	rustc_version-0.3.3
	semver-0.11.0
	semver-parser-0.10.2
	strsim-0.8.0
	structopt-0.3.21
	structopt-derive-0.4.14
	syn-1.0.71
	term_size-0.3.2
	textwrap-0.11.0
	ucd-trie-0.1.3
	unicode-segmentation-1.7.1
	unicode-width-0.1.8
	unicode-xid-0.2.1
	vec_map-0.8.2
	version_check-0.9.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A high performance code minimap generator"
HOMEPAGE="https://github.com/wfxr/code-minimap"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"
