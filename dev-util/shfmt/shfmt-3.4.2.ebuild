# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Shell parser, formater and interpreter with bash support"
HOMEPAGE="https://github.com/mvdan/sh"

# Building this list can be done by:
# cd $(mktemp -d)
# PV="3.4.2"
# wget https://github.com/mvdan/sh/archive/v${PV}.tar.gz
# tar -xvzf v${PV}.tar.gz
# sed -Ee 's/^(.+) h1:.+$/\t"\1"/g' sh-${PV}/go.sum > go.sum.out
EGO_SUM=(
	"github.com/creack/pty v1.1.9/go.mod"
	"github.com/creack/pty v1.1.15"
	"github.com/creack/pty v1.1.15/go.mod"
	"github.com/frankban/quicktest v1.13.1"
	"github.com/frankban/quicktest v1.13.1/go.mod"
	"github.com/google/go-cmp v0.5.6"
	"github.com/google/go-cmp v0.5.6/go.mod"
	"github.com/google/renameio v1.0.1"
	"github.com/google/renameio v1.0.1/go.mod"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pretty v0.3.0"
	"github.com/kr/pretty v0.3.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e"
	"github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e/go.mod"
	"github.com/rogpeppe/go-internal v1.6.1/go.mod"
	"github.com/rogpeppe/go-internal v1.8.1-0.20210923151022-86f73c517451"
	"github.com/rogpeppe/go-internal v1.8.1-0.20210923151022-86f73c517451/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod"
	"golang.org/x/sys v0.0.0-20210925032602-92d5a993a665"
	"golang.org/x/sys v0.0.0-20210925032602-92d5a993a665/go.mod"
	"golang.org/x/term v0.0.0-20210916214954-140adaaadfaf"
	"golang.org/x/term v0.0.0-20210916214954-140adaaadfaf/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/errgo.v2 v2.1.0"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"mvdan.cc/editorconfig v0.2.0"
	"mvdan.cc/editorconfig v0.2.0/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/mvdan/sh/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

S="${WORKDIR}/sh-${PV}"
LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

src_compile() {
	export CGO_ENABLED=0
	go build -v -work -x -ldflags \
		"-X main.version=${PV} -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
		./cmd/shfmt || die "compile failed"
}

src_install() {
	dobin ${PN}
}
