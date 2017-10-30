# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_VENDOR=( "github.com/BurntSushi/toml a368813c5e648fee92e5f6c30e3944ff9d5e8895"
	"github.com/PuerkitoBio/purell 0bcb03f4b4d0a9428594752bd2a3b9aa0a9d4bd4"
	"github.com/PuerkitoBio/urlesc de5bf2ad457846296e2031421a34e2568e304e35"
	"github.com/alecthomas/chroma 03b0c0d6bb7b9f7f8fd58fca6f1c6a2caffb9ca8"
	"github.com/bep/gitmap de8030ebafb76c6e84d50ee6d143382637c00598"
	"github.com/chaseadamsio/goorgeous 7daffad08e0d467847663af3655dcc4cbcda48e8"
	"github.com/cpuguy83/go-md2man 1d903dcb749992f3741d744c0f8376b4bd7eb3e1"
	"github.com/danwakefield/fnmatch cbb64ac3d964b81592e64f957ad53df015803288"
	"github.com/davecgh/go-spew 346938d642f2ec3594ed81d874461961cd0faa76"
	"github.com/dchest/cssmin fb8d9b44afdc258bfff6052d3667521babcb2239"
	"github.com/dlclark/regexp2 487489b64fb796de2e55f4e8a4ad1e145f80e957"
	"github.com/eknkc/amber cdade1c073850f4ffc70a829e31235ea6892853b"
	"github.com/fortytw2/leaktest 7dad53304f9614c1c365755c1176a8e876fee3e8"
	"github.com/fsnotify/fsnotify 629574ca2a5df945712d3079857300b5e4da0236"
	"github.com/gorilla/websocket ea4d1f681babbce9545c9c5f3d5194a789c89f5b"
	"github.com/hashicorp/go-immutable-radix 8aac2701530899b64bdea735a1de8da899815220"
	"github.com/hashicorp/golang-lru 0a025b7e63adc15a622f29b0b2c4c3848243bbf6"
	"github.com/hashicorp/hcl 23c074d0eceb2b8a5bfdbb271ab780cde70f05a8"
	"github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
	"github.com/jdkato/prose 20d3663d4bc9dd10d75abcde9d92e04b4861c674"
	"github.com/kardianos/osext ae77be60afb1dcacde03767a8c37337fad28ac14"
	"github.com/kyokomi/emoji 7e06b236c489543f53868841f188a294e3383eab"
	"github.com/magefile/mage 2f974307b636f59c13b88704cf350a4772fef271"
	"github.com/magiconair/properties be5ece7dd465ab0765a9682137865547526d1dfb"
	"github.com/markbates/inflect ea17041f342f81e8849284b87bc3db1a6fc596bb"
	"github.com/miekg/mmark fd2f6c1403b37925bd7fe13af05853b8ae58ee5f"
	"github.com/mitchellh/mapstructure 06020f85339e21b2478f756a78e295255ffa4d6a"
	"github.com/nicksnyder/go-i18n ca33e78c8a430e2df435b02f63a3944fa8e9ea11"
	"github.com/pelletier/go-toml 16398bac157da96aa88f98a2df640c7f32af1da2"
	"github.com/pmezard/go-difflib 792786c7400a136282c1664665ae0a8db921c6c2"
	"github.com/russross/blackfriday 4048872b16cc0fc2c5fd9eacf0ed2c2fedaa0c8c"
	"github.com/shurcooL/sanitized_anchor_name 86672fcb3f950f35f2e675df2240550f2a50762f"
	"github.com/spf13/afero 5660eeed305fe5f69c8fc6cf899132a459a97064"
	"github.com/spf13/cast acbeb36b902d72a7a4c18e8f3241075e7ab763e4"
	"github.com/spf13/cobra 7b2c5ac9fc04fc5efafb60700713d4fa609b777b"
	"github.com/spf13/fsync 12a01e648f05a938100a26858d2d59a120307a18"
	"github.com/spf13/jwalterweatherman 12bd96e66386c1960ab0f74ced1362f66f552f7b"
	"github.com/spf13/nitro 24d7ef30a12da0bdc5e2eb370a79c659ddccf0e8"
	"github.com/spf13/pflag e57e3eeb33f795204c1ca35f56c44f83227c6e66"
	"github.com/spf13/viper 25b30aa063fc18e48662b86996252eabdcf2f0c7"
	"github.com/stretchr/testify 69483b4bd14f5845b5a1e55bca19e954e827f1d0"
	"github.com/yosssi/ace ea038f4770b6746c3f8f84f14fa60d9fe1205b56"
	"golang.org/x/image f7e31b4ea2e3413ab91b4e7d2dc83e5f8d19a44c github.com/golang/image"
	"golang.org/x/net cd69bc3fc700721b709c3a59e16e24c67b58f6ff github.com/golang/net"
	"golang.org/x/sys 8dbc5d05d6edcc104950cc299a1ce6641235bc86 github.com/golang/sys"
	"golang.org/x/text c01e4764d870b77f8abe5096ee19ad20d80e8075 github.com/golang/text"
	"gopkg.in/yaml.v2 eb3733d160e74a9c7e442f435eb3bea458e1d19f github.com/go-yaml/yaml" )

inherit golang-build golang-vcs-snapshot bash-completion-r1

EGO_PN="github.com/gohugoio/hugo"
GIT_COMMIT="142ebba"
ARCHIVE_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A Fast and Flexible Static Site Generator built with love in Go"
HOMEPAGE="https://gohugo.io https://github.com/gohugoio/hugo"
SRC_URI="${ARCHIVE_URI}
	${EGO_VENDOR_URI}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RESTRICT="test"

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${S}" go install || die
	popd || die
	bin/hugo gen man || die
	bin/hugo gen autocomplete --completionfile hugo || die
}

src_install() {
	dobin bin/*
	dobashcomp hugo || die
	doman man/*
	dodoc src/${EGO_PN}/README.md
}
