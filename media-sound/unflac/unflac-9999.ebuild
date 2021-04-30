# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module git-r3

DESCRIPTION="A command line tool for fast frame accurate audio image + cue sheet splitting"
HOMEPAGE="https://git.sr.ht/~ft/unflac"

LICENSE="FREE"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-video/ffmpeg
"

EGO_SUM=(
	"git.sr.ht/~ft/cue v0.0.0-20200508193024-48a5e773bbae"
	"git.sr.ht/~ft/cue v0.0.0-20200508193024-48a5e773bbae/go.mod"
	"github.com/asdfsx/gochardet v0.0.0-20170222172924-16496b196583"
	"github.com/asdfsx/gochardet v0.0.0-20170222172924-16496b196583/go.mod"
	"github.com/gammazero/deque v0.0.0-20190521012701-46e4ffb7a622"
	"github.com/gammazero/deque v0.0.0-20190521012701-46e4ffb7a622/go.mod"
	"github.com/gammazero/workerpool v0.0.0-20191211212902-79f70a4b5331"
	"github.com/gammazero/workerpool v0.0.0-20191211212902-79f70a4b5331/go.mod"
	"github.com/saintfish/chardet v0.0.0-20120816061221-3af4cd4741ca"
	"github.com/saintfish/chardet v0.0.0-20120816061221-3af4cd4741ca/go.mod"
	"golang.org/x/text v0.3.2"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
)

go-module_set_globals
EGIT_REPO_URI="https://git.sr.ht/~ft/unflac"

src_compile() {
	go build || die
}

src_install() {
	dobin unflac
}
