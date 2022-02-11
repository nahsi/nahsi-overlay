# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="An application to control your Elgato Stream Deck on Linux"
HOMEPAGE="https://github.com/muesli/deckmaster"

# Building this list can be done by:
# cd $(mktemp -d)
# PV="0.6.0"
# wget https://github.com/muesli/deckmaster/archive/v${PV}.tar.gz
# tar -xvzf v${PV}.tar.gz
# sed -Ee 's/^(.+) h1:.+$/\t"\1"/g' deckmaster-${PV}/go.sum > go.sum.out
EGO_SUM=(
	"github.com/BurntSushi/freetype-go v0.0.0-20160129220410-b763ddbfe298"
	"github.com/BurntSushi/freetype-go v0.0.0-20160129220410-b763ddbfe298/go.mod"
	"github.com/BurntSushi/graphics-go v0.0.0-20160129215708-b43f31a4a966"
	"github.com/BurntSushi/graphics-go v0.0.0-20160129215708-b43f31a4a966/go.mod"
	"github.com/BurntSushi/toml v1.0.0"
	"github.com/BurntSushi/toml v1.0.0/go.mod"
	"github.com/atotto/clipboard v0.1.4"
	"github.com/atotto/clipboard v0.1.4/go.mod"
	"github.com/bendahl/uinput v1.5.0"
	"github.com/bendahl/uinput v1.5.0/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.1/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/flopp/go-findfont v0.1.0"
	"github.com/flopp/go-findfont v0.1.0/go.mod"
	"github.com/go-ole/go-ole v1.2.6"
	"github.com/go-ole/go-ole v1.2.6/go.mod"
	"github.com/godbus/dbus v4.1.0+incompatible"
	"github.com/godbus/dbus v4.1.0+incompatible/go.mod"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0"
	"github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/jezek/xgb v0.0.0-20210312150743-0e0f116e1240"
	"github.com/jezek/xgb v0.0.0-20210312150743-0e0f116e1240/go.mod"
	"github.com/jezek/xgbutil v0.0.0-20210302171758-530099784e66"
	"github.com/jezek/xgbutil v0.0.0-20210302171758-530099784e66/go.mod"
	"github.com/karalabe/hid v1.0.1-0.20190806082151-9c14560f9ee8"
	"github.com/karalabe/hid v1.0.1-0.20190806082151-9c14560f9ee8/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.2.0"
	"github.com/lucasb-eyer/go-colorful v1.2.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/muesli/coral v1.0.0/go.mod"
	"github.com/muesli/streamdeck v0.2.3-0.20220205132636-dbbc8865ab8c"
	"github.com/muesli/streamdeck v0.2.3-0.20220205132636-dbbc8865ab8c/go.mod"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646"
	"github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/shirou/gopsutil v3.21.11+incompatible"
	"github.com/shirou/gopsutil v3.21.11+incompatible/go.mod"
	"github.com/spf13/pflag v1.0.5/go.mod"
	"github.com/stretchr/testify v1.2.2"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/tklauser/go-sysconf v0.3.9"
	"github.com/tklauser/go-sysconf v0.3.9/go.mod"
	"github.com/tklauser/numcpus v0.3.0"
	"github.com/tklauser/numcpus v0.3.0/go.mod"
	"github.com/yusufpapurcu/wmi v1.2.2"
	"github.com/yusufpapurcu/wmi v1.2.2/go.mod"
	"golang.org/x/image v0.0.0-20200119044424-58c23975cae1/go.mod"
	"golang.org/x/image v0.0.0-20210628002857-a66eb6448b8d"
	"golang.org/x/image v0.0.0-20210628002857-a66eb6448b8d/go.mod"
	"golang.org/x/sys v0.0.0-20190916202348-b4ddaad3f8a3/go.mod"
	"golang.org/x/sys v0.0.0-20210816074244-15123e1e1f71"
	"golang.org/x/sys v0.0.0-20210816074244-15123e1e1f71/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v2 v2.4.0/go.mod"
)

go-module_set_globals
SRC_URI="https://github.com/muesli/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"

src_compile() {
	go build -o ${PN} -v -work -x -ldflags \
		"-X main.Version=${PV} -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
		|| die "compile failed"
}

src_install() {
	dobin ${PN}
}
