# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
EGO_VENDOR=( "github.com/BurntSushi/toml b26d9c308763d68093482582cea63d69be07a0f0"
	"github.com/PuerkitoBio/purell b938d81255b5473c57635324295cb0fe398c7a58"
	"github.com/PuerkitoBio/urlesc bbf7a2afc14f93e1e0a5c06df524fbd75e5031e5"
	"github.com/bep/gitmap dcb907b39a0690430d435eb8f63cd8811961231f"
	"github.com/bep/inflect b896c45f5af983b1f416bdf3bb89c4f1f0926f69"
	"github.com/chaseadamsio/goorgeous 42b0ec184e93fc9fd2c0402f099a4939aba68407"
	"github.com/cpuguy83/go-md2man a65d4d2de4d5f7c74868dfa9b202a3c8be315aaa"
	"github.com/dchest/cssmin fb8d9b44afdc258bfff6052d3667521babcb2239"
	"github.com/eknkc/amber d15eb996544134263b00cce829b5bc4988fdb2df"
	"github.com/fortytw2/leaktest 0db74e8cd5adacfcc982838c6e185789e4b44e14"
	"github.com/fsnotify/fsnotify 4da3e2cfbabc9f751898f250b49f2439785783a1"
	"github.com/gorilla/websocket a91eba7f97777409bc2c443f5534d41dd20c5720"
	"github.com/hashicorp/hcl 630949a3c5fa3c613328e1b8256052cbc2327c9b"
	"github.com/inconshreveable/mousetrap 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
	"github.com/kardianos/osext 9d302b58e975387d0b4d9be876622c86cefe64be"
	"github.com/kr/fs 2788f0dbd16903de03cb8186e5c7d97b69ad387b"
	"github.com/kyokomi/emoji 7ad0be7be9d4ee6ec2cf5df483dbec752626ac64"
	"github.com/magiconair/properties 51463bfca2576e06c62a8504b5c0f06d61312647"
	"github.com/miekg/mmark 8b498b013a3e10b12864c2023a59d490c9d4bf5b"
	"github.com/mitchellh/mapstructure 53818660ed4955e899c0bcafa97299a388bd7c8e"
	"github.com/nicksnyder/go-i18n f373441d6d54a32891b2d8b1dbf99bc518f3d60d"
	"github.com/opennota/urlesc 5bd2802263f21d8788851d5305584c82a5c75d7e"
	"github.com/pelletier/go-buffruneio c37440a7cf42ac63b919c752ca73a85067e05992"
	"github.com/pelletier/go-toml fe206efb84b2bc8e8cfafe6b4c1826622be969e3"
	"github.com/pkg/errors ff09b135c25aae272398c51a07235b90a75aa4f0"
	"github.com/pkg/sftp 4d0e916071f68db74f8a73926335f809396d6b42"
	"github.com/russross/blackfriday b253417e1cb644d645a0a3bb1fa5034c8030127c"
	"github.com/shurcooL/sanitized_anchor_name 1dba4b3954bc059efc3991ec364f9f9a35f597d2"
	"github.com/spf13/afero 9be650865eab0c12963d8753212f4f9c66cdcf12"
	"github.com/spf13/cast acbeb36b902d72a7a4c18e8f3241075e7ab763e4"
	"github.com/spf13/cobra 5deb57bbca49eb370538fc295ba4b2988f9f5e09"
	"github.com/spf13/fsync 12a01e648f05a938100a26858d2d59a120307a18"
	"github.com/spf13/jwalterweatherman fa7ca7e836cf3a8bb4ebf799f472c12d7e903d66"
	"github.com/spf13/nitro 24d7ef30a12da0bdc5e2eb370a79c659ddccf0e8"
	"github.com/spf13/pflag e453343e6260b4a3a89f1f0e10a2fbb07f8d9750"
	"github.com/spf13/viper 5d46e70da8c0b6f812e0b170b7a985753b5c63cb"
	"github.com/stretchr/testify 4d4bfba8f1d1027c4fdbe371823030df51419987"
	"github.com/yosssi/ace ea038f4770b6746c3f8f84f14fa60d9fe1205b56"
	"golang.org/x/crypto cbc3d0884eac986df6e78a039b8792e869bff863 github.com/golang/crypto"
	"golang.org/x/net 5602c733f70afc6dcec6766be0d5034d4c4f14de github.com/golang/net"
	"golang.org/x/sys f3918c30c5c2cb527c0b071a27c35120a6c0719a github.com/golang/sys"
	"golang.org/x/text f4b4367115ec2de254587813edaa901bc1c723a8 github.com/golang/text"
	"gopkg.in/yaml.v2 cd8b52f8269e0feb286dfeef29f8fe4d5b397e0b github.com/go-yaml/yaml" )

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/spf13/hugo/..."
GIT_COMMIT="8ac1fcd"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A Fast and Flexible Static Site Generator built with love in Go"
HOMEPAGE="https://github.com/spf13/hugo"
SRC_URI="${ARCHIVE_URI}
	${EGO_VENDOR_URI}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND=">=dev-python/pygments-2.1.3"

src_prepare() {
	default
	sed -i -e "s/^COMMIT_HASH.*/COMMIT_HASH = ${GIT_COMMIT}/" -e "s/install: vendor/install:/" src/${EGO_PN%/.*}/Makefile || die
}

src_compile() {
	GOPATH="${WORKDIR}/${P}" emake -C src/${EGO_PN%/.*} install || die
}

src_install() {
	dobin bin/*
}
