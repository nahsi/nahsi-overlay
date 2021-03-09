# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

DESCRIPTION="A utility for managing various observability resources with Jsonnet"
HOMEPAGE="https://github.com/grafana/grizzly"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

EGO_SUM=(
	"github.com/centrifugal/centrifuge-go v0.6.2"
	"github.com/fatih/color v1.9.0"
	"github.com/fsnotify/fsnotify v1.4.7"
	"github.com/gdamore/tcell v1.3.0"
	"github.com/go-clix/cli v0.1.0"
	"github.com/gobwas/glob v0.2.3"
	"github.com/google/go-jsonnet v0.17.0"
	"github.com/hashicorp/go-version v1.2.1"
	"github.com/kr/pretty v0.2.0"
	"github.com/kylelemons/godebug v1.1.0"
	"github.com/mattn/go-colorable v0.1.6"
	"github.com/mitchellh/gox v1.0.1"
	"github.com/mitchellh/mapstructure v1.3.3"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/rivo/tview v0.0.0-20200818120338-53d50e499bf9"
	"github.com/stretchr/testify v1.5.1"
	"golang.org/x/crypto v0.0.0-20200422194213-44a606286825"
	"gopkg.in/fsnotify.v1 v1.4.7"
	"gopkg.in/yaml.v2 v2.3.0"
	"gopkg.in/yaml.v3 v3.0.0-20200603094226-e3079894b1e8"
)

go-module_set_globals
SRC_URI="https://github.com/grafana/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"

src_compile() {
	go build || die
}

src_install() {
	dobin grr
}
