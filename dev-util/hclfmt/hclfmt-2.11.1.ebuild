# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="HCL formatter"
HOMEPAGE="https://github.com/hashicorp/hcl"

# Building this list can be done by:
# cd $(mktemp -d)
# PV="2.11.1"
# wget https://github.com/hashicorp/hcl/archive/v${PV}.tar.gz
# tar -xvzf v${PV}.tar.gz
# sed -Ee 's/^(.+) h1:.+$/\t"\1"/g' hcl-${PV}/go.sum > go.sum.out
EGO_SUM=(
	"github.com/agext/levenshtein v1.2.1"
	"github.com/agext/levenshtein v1.2.1/go.mod"
	"github.com/apparentlymart/go-dump v0.0.0-20180507223929-23540a00eaa3"
	"github.com/apparentlymart/go-dump v0.0.0-20180507223929-23540a00eaa3/go.mod"
	"github.com/apparentlymart/go-textseg v1.0.0"
	"github.com/apparentlymart/go-textseg v1.0.0/go.mod"
	"github.com/apparentlymart/go-textseg/v13 v13.0.0"
	"github.com/apparentlymart/go-textseg/v13 v13.0.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/go-test/deep v1.0.3"
	"github.com/go-test/deep v1.0.3/go.mod"
	"github.com/golang/protobuf v1.1.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.4/go.mod"
	"github.com/google/go-cmp v0.3.1"
	"github.com/google/go-cmp v0.3.1/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/kylelemons/godebug v0.0.0-20170820004349-d65d576e9348"
	"github.com/kylelemons/godebug v0.0.0-20170820004349-d65d576e9348/go.mod"
	"github.com/mitchellh/go-wordwrap v0.0.0-20150314170334-ad45545899c7"
	"github.com/mitchellh/go-wordwrap v0.0.0-20150314170334-ad45545899c7/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.2"
	"github.com/spf13/pflag v1.0.2/go.mod"
	"github.com/stretchr/testify v1.2.2"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/vmihailenco/msgpack v3.3.3+incompatible/go.mod"
	"github.com/vmihailenco/msgpack/v4 v4.3.12/go.mod"
	"github.com/vmihailenco/tagparser v0.1.1/go.mod"
	"github.com/zclconf/go-cty v1.2.0/go.mod"
	"github.com/zclconf/go-cty v1.8.0"
	"github.com/zclconf/go-cty v1.8.0/go.mod"
	"github.com/zclconf/go-cty-debug v0.0.0-20191215020915-b22d67c1ba0b"
	"github.com/zclconf/go-cty-debug v0.0.0-20191215020915-b22d67c1ba0b/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190426145343-a29dc8fdc734"
	"golang.org/x/crypto v0.0.0-20190426145343-a29dc8fdc734/go.mod"
	"golang.org/x/net v0.0.0-20180811021610-c39426892332/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20200301022130-244492dfa37a/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190502175342-a43fa875dd82"
	"golang.org/x/sys v0.0.0-20190502175342-a43fa875dd82/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/text v0.3.5"
	"golang.org/x/text v0.3.5/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.6.5/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/hashicorp/hcl/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

S="${WORKDIR}/hcl-${PV}"
LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

src_compile() {
	go build -v -work -x -ldflags \
		"-X main.version=${PV} -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
		./cmd/hclfmt || die "compile failed"
}

src_install() {
	dobin ${PN}
}
