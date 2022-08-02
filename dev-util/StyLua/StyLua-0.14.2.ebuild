# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.18
	anyhow-1.0.53
	assert_cmd-2.0.4
	atty-0.2.14
	autocfg-1.0.1
	bitflags-1.3.2
	bstr-0.2.16
	bumpalo-3.7.0
	bytecount-0.5.1
	cast-0.2.7
	cfg-if-1.0.0
	clap-2.33.3
	clap-3.1.6
	clap_derive-3.1.4
	console-0.15.0
	convert_case-0.4.0
	criterion-0.3.5
	criterion-plot-0.4.4
	crossbeam-channel-0.5.4
	crossbeam-deque-0.8.1
	crossbeam-epoch-0.9.5
	crossbeam-utils-0.8.7
	csv-1.1.6
	csv-core-0.1.10
	derive_more-0.99.16
	difflib-0.4.0
	doc-comment-0.3.3
	dtoa-0.4.8
	either-1.6.1
	encode_unicode-0.3.6
	env_logger-0.9.0
	fnv-1.0.7
	full_moon-0.15.1
	full_moon_derive-0.10.0
	globset-0.4.8
	half-1.7.1
	hashbrown-0.11.2
	heck-0.4.0
	hermit-abi-0.1.19
	ignore-0.4.18
	indexmap-1.7.0
	insta-1.12.0
	itertools-0.10.1
	itoa-0.4.8
	itoa-1.0.1
	js-sys-0.3.55
	lazy_static-1.4.0
	libc-0.2.119
	linked-hash-map-0.5.4
	log-0.4.14
	memchr-2.4.1
	memoffset-0.6.4
	num-traits-0.2.14
	num_cpus-1.13.1
	once_cell-1.9.0
	oorandom-11.1.3
	os_str_bytes-6.0.0
	paste-0.1.18
	paste-impl-0.1.18
	peg-0.7.0
	peg-macros-0.7.0
	peg-runtime-0.7.0
	pest-2.1.3
	plotters-0.3.1
	plotters-backend-0.3.2
	plotters-svg-0.3.1
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.29
	quote-1.0.9
	rayon-1.5.1
	rayon-core-1.9.1
	regex-1.5.4
	regex-automata-0.1.10
	regex-syntax-0.6.25
	rustc_version-0.3.3
	rustc_version-0.4.0
	ryu-1.0.5
	same-file-1.0.6
	scopeguard-1.1.0
	semver-0.11.0
	semver-1.0.4
	semver-parser-0.10.2
	serde-1.0.136
	serde_cbor-0.11.2
	serde_derive-1.0.136
	serde_json-1.0.79
	serde_yaml-0.8.21
	similar-2.1.0
	smol_str-0.1.18
	strsim-0.10.0
	syn-1.0.76
	termcolor-1.1.3
	terminal_size-0.1.17
	termtree-0.2.4
	textwrap-0.11.0
	textwrap-0.15.0
	thiserror-1.0.31
	thiserror-impl-1.0.31
	thread_local-1.1.3
	threadpool-1.8.1
	tinytemplate-1.2.1
	toml-0.5.8
	ucd-trie-0.1.3
	unicode-width-0.1.8
	unicode-xid-0.2.2
	version_check-0.9.3
	wait-timeout-0.2.0
	walkdir-2.3.2
	wasm-bindgen-0.2.81
	wasm-bindgen-backend-0.2.81
	wasm-bindgen-macro-0.2.81
	wasm-bindgen-macro-support-0.2.81
	wasm-bindgen-shared-0.2.81
	web-sys-0.3.55
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	yaml-rust-0.4.5
"

inherit cargo

DESCRIPTION="A code formatter for Lua"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/johnnymorganz/stylua"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 Boost-1.0 MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="~amd64"
