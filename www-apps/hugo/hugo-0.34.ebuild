# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_VENDOR=( "github.com/BurntSushi/toml a368813c5e648fee92e5f6c30e3944ff9d5e8895"
	"github.com/PuerkitoBio/purell 0bcb03f4b4d0a9428594752bd2a3b9aa0a9d4bd4"
	"github.com/PuerkitoBio/urlesc de5bf2ad457846296e2031421a34e2568e304e35"
	"github.com/alecthomas/chroma e0f32fbcb59bc99c521910291b7ba8ecdb17ca34"
	"github.com/bep/gitmap de8030ebafb76c6e84d50ee6d143382637c00598"
	"github.com/chaseadamsio/goorgeous dcf1ef873b8987bf12596fe6951c48347986eb2f"
	"github.com/cpuguy83/go-md2man 1d903dcb749992f3741d744c0f8376b4bd7eb3e1"
	"github.com/danwakefield/fnmatch cbb64ac3d964b81592e64f957ad53df015803288"
	"github.com/davecgh/go-spew 346938d642f2ec3594ed81d874461961cd0faa76"
	"github.com/disintegration/imaging dd50a3ee9985ccd313a2f03c398fcaedc96dc707"
	"github.com/dlclark/regexp2 487489b64fb796de2e55f4e8a4ad1e145f80e957"
	"github.com/eknkc/amber cdade1c073850f4ffc70a829e31235ea6892853b"
	"github.com/fortytw2/leaktest 7dad53304f9614c1c365755c1176a8e876fee3e8"
	"github.com/fsnotify/fsnotify 629574ca2a5df945712d3079857300b5e4da0236"
	"github.com/gobwas/glob bea32b9cd2d6f55753d94a28e959b13f0244797a"
	"github.com/gorilla/websocket ea4d1f681babbce9545c9c5f3d5194a789c89f5b"
	"github.com/hashicorp/go-immutable-radix 8aac2701530899b64bdea735a1de8da899815220"
	"github.com/hashicorp/golang-lru 0a025b7e63adc15a622f29b0b2c4c3848243bbf6"
	"github.com/hashicorp/hcl 23c074d0eceb2b8a5bfdbb271ab780cde70f05a8"
	"github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
	"github.com/jdkato/prose 20d3663d4bc9dd10d75abcde9d92e04b4861c674"
	"github.com/kyokomi/emoji 7e06b236c489543f53868841f188a294e3383eab"
	"github.com/magefile/mage 2f974307b636f59c13b88704cf350a4772fef271"
	"github.com/magiconair/properties d419a98cdbed11a922bf76f257b7c4be79b50e73"
	"github.com/markbates/inflect a12c3aec81a6a938bf584a4bac567afed9256586"
	"github.com/mattn/go-runewidth 9e777a8366cce605130a531d2cd6363d07ad7317"
	"github.com/miekg/mmark fd2f6c1403b37925bd7fe13af05853b8ae58ee5f"
	"github.com/mitchellh/mapstructure b4575eea38cca1123ec2dc90c26529b5c5acfcff"
	"github.com/nicksnyder/go-i18n 0dc1626d56435e9d605a29875701721c54bc9bbd"
	"github.com/olekukonko/tablewriter 96aac992fc8b1a4c83841a6c3e7178d20d989625"
	"github.com/pelletier/go-toml 16398bac157da96aa88f98a2df640c7f32af1da2"
	"github.com/pmezard/go-difflib 792786c7400a136282c1664665ae0a8db921c6c2"
	"github.com/russross/blackfriday 4048872b16cc0fc2c5fd9eacf0ed2c2fedaa0c8c"
	"github.com/shurcooL/sanitized_anchor_name 86672fcb3f950f35f2e675df2240550f2a50762f"
	"github.com/spf13/afero bb8f1927f2a9d3ab41c9340aa034f6b803f4359c"
	"github.com/spf13/cast acbeb36b902d72a7a4c18e8f3241075e7ab763e4"
	"github.com/spf13/cobra b95ab734e27d33e0d8fbabf71ca990568d4e2020"
	"github.com/spf13/fsync 12a01e648f05a938100a26858d2d59a120307a18"
	"github.com/spf13/jwalterweatherman 7c0cea34c8ece3fbeb2b27ab9b59511d360fb394"
	"github.com/spf13/nitro 24d7ef30a12da0bdc5e2eb370a79c659ddccf0e8"
	"github.com/spf13/pflag e57e3eeb33f795204c1ca35f56c44f83227c6e66"
	"github.com/spf13/viper 25b30aa063fc18e48662b86996252eabdcf2f0c7"
	"github.com/stretchr/testify b91bfb9ebec76498946beb6af7c0230c7cc7ba6c"
	"github.com/yosssi/ace ea038f4770b6746c3f8f84f14fa60d9fe1205b56"
	"golang.org/x/image 12117c17ca67ffa1ce22e9409f3b0b0a93ac08c7 github.com/golang/image"
	"golang.org/x/net 5ccada7d0a7ba9aeb5d3aca8d3501b4c2a509fec github.com/golang/net"
	"golang.org/x/sync fd80eb99c8f653c847d294a001bdf2a3a6f768f5 github.com/golang/sync"
	"golang.org/x/sys 810d7000345868fc619eb81f46307107118f4ae1 github.com/golang/sys"
	"golang.org/x/text e19ae1496984b1c655b8044a65c0300a3c878dd3 github.com/golang/text"
	"gopkg.in/yaml.v2 d670f9405373e636a5a2765eea47fac0c9bc91a4 github.com/go-yaml/yaml" )

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
