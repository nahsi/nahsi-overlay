# Copyright 2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit bash-completion-r1 go-module

DESCRIPTION="A session manager for tmux written in Go"
HOMEPAGE="https://github.com/ivaaaan/smug"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-misc/tmux
"

EGO_SUM=(
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v2 v2.4.0"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/ivaaaan/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		${EGO_SUM_SRC_URI}"

src_compile() {
  go build || die
}

src_install() {
  dobin smug
  newbashcomp "${S}/completion/smug.bash" smug
}
