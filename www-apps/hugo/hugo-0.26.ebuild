# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_VENDOR=( "github.com/BurntSushi/toml a368813c5e648fee92e5f6c30e3944ff9d5e8895"
	"github.com/PuerkitoBio/purell b938d81255b5473c57635324295cb0fe398c7a58"
	"github.com/PuerkitoBio/urlesc bbf7a2afc14f93e1e0a5c06df524fbd75e5031e5"
	"github.com/bep/gitmap de8030ebafb76c6e84d50ee6d143382637c00598"
	"github.com/chaseadamsio/goorgeous 677defd0e024333503d8c946dd4ba3f32ad3e5d2"
	"github.com/cpuguy83/go-md2man 23709d0847197db6021a51fdb193e66e9222d4e7"
	"github.com/dchest/cssmin fb8d9b44afdc258bfff6052d3667521babcb2239"
	"github.com/eknkc/amber b8bd8b03e4f747e33f092617225e9fa8076c0448"
	"github.com/fortytw2/leaktest 3b724c3d7b8729a35bf4e577f71653aec6e53513"
	"github.com/fsnotify/fsnotify 4da3e2cfbabc9f751898f250b49f2439785783a1"
	"github.com/gorilla/websocket a69d9f6de432e2c6b296a947d8a5ee88f68522cf"
	"github.com/hashicorp/go-immutable-radix 8aac2701530899b64bdea735a1de8da899815220"
	"github.com/hashicorp/golang-lru 0a025b7e63adc15a622f29b0b2c4c3848243bbf6"
	"github.com/hashicorp/hcl 392dba7d905ed5d04a5794ba89f558b27e2ba1ca"
	"github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
	"github.com/jdkato/prose c24611cae00c16858e611ef77226dd2f7502759f"
	"github.com/kardianos/osext ae77be60afb1dcacde03767a8c37337fad28ac14"
	"github.com/kyokomi/emoji ddd4753eac3f6480ca86b16cc6c98d26a0935d17"
	"github.com/magiconair/properties 51463bfca2576e06c62a8504b5c0f06d61312647"
	"github.com/markbates/inflect 6cacb66d100482ef7cc366289ccb156020e57e76"
	"github.com/miekg/mmark fd2f6c1403b37925bd7fe13af05853b8ae58ee5f"
	"github.com/mitchellh/mapstructure d0303fe809921458f417bcf828397a65db30a7e4"
	"github.com/nicksnyder/go-i18n 3e70a1a463008cea6726380c908b1a6a8bdf7b24"
	"github.com/pelletier/go-buffruneio c37440a7cf42ac63b919c752ca73a85067e05992"
	"github.com/pelletier/go-toml 69d355db5304c0f7f809a2edc054553e7142f016"
	"github.com/russross/blackfriday 4048872b16cc0fc2c5fd9eacf0ed2c2fedaa0c8c"
	"github.com/shurcooL/sanitized_anchor_name 541ff5ee47f1dddf6a5281af78307d921524bcb5"
	"github.com/spf13/afero 9be650865eab0c12963d8753212f4f9c66cdcf12"
	"github.com/spf13/cast acbeb36b902d72a7a4c18e8f3241075e7ab763e4"
	"github.com/spf13/cobra 34594c771f2c18301dc152640ad40ece28795373"
	"github.com/spf13/fsync 12a01e648f05a938100a26858d2d59a120307a18"
	"github.com/spf13/jwalterweatherman 0efa5202c04663c757d84f90f5219c1250baf94f"
	"github.com/spf13/nitro 24d7ef30a12da0bdc5e2eb370a79c659ddccf0e8"
	"github.com/spf13/pflag e57e3eeb33f795204c1ca35f56c44f83227c6e66"
	"github.com/spf13/viper 25b30aa063fc18e48662b86996252eabdcf2f0c7"
	"github.com/stretchr/testify 05e8a0eda380579888eb53c394909df027f06991"
	"github.com/yosssi/ace ea038f4770b6746c3f8f84f14fa60d9fe1205b56"
	"golang.org/x/image 426cfd8eeb6e08ab1932954e09e3c2cb2bc6e36d github.com/golang/image"
	"golang.org/x/net f5079bd7f6f74e23c4d65efa0f4ce14cbd6a3c0f github.com/golang/net"
	"golang.org/x/sys 35ef4487ce0a1ea5d4b616ffe71e34febe723695 github.com/golang/sys"
	"golang.org/x/text 836efe42bb4aa16aaa17b9c155d8813d336ed720 github.com/golang/text"
	"gopkg.in/yaml.v2 25c4ec802a7d637f88d584ab26798e94ad14c13b github.com/go-yaml/yaml" )

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gohugoio/hugo"
GIT_COMMIT="f090c27"
ARCHIVE_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A Fast and Flexible Static Site Generator built with love in Go"
HOMEPAGE="https://gohugo.io https://github.com/gohugoio/hugo"
SRC_URI="${ARCHIVE_URI}
	${EGO_VENDOR_URI}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND=">=dev-python/pygments-2.1.3"

RESTRICT="test"

src_prepare() {
	default
	sed -i -e "s/^COMMIT_HASH.*/COMMIT_HASH = ${GIT_COMMIT}/" -e "s/install: vendor/install:/" src/${EGO_PN}/Makefile || die
}

src_compile() {
	GOPATH="${WORKDIR}/${P}" emake -C src/${EGO_PN} install || die
}

src_install() {
	dobin bin/*
	dodoc src/${EGO_PN}/README.md
}
