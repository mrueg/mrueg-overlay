# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_VENDOR=(
	"github.com/Azure/azure-sdk-for-go 088007b3b08cc02b27f2eadfdcd870958460ce7e"
	"github.com/Azure/go-autorest a2fdd780c9a50455cecd249b00bdc3eb73a78e31"
	"github.com/JamesClonk/vultr 0f156dd232bc4ebf8a32ba83fec57c0e4c9db69f"
	"github.com/aws/aws-sdk-go baba9e786eae5ba978f2007f8e718557b29157c8"
	"github.com/decker502/dnspod-go 68650ee11e182e30773781d391c66a0c80ccf9f2"
	"github.com/dgrijalva/jwt-go 2268707a8f0843315e2004ee4f1d021dc08baedf"
	"github.com/dnsimple/dnsimple-go 5a5b427618a76f9eed5ede0f3e6306fbd9311d2e"
	"github.com/edeckers/auroradnsclient 8b777c170cfd377aa16bb4368f093017dddef3f9"
	"github.com/google/go-querystring 53e6ce116135b80d037921a7fdd5138cf32d7a8a"
	"github.com/miekg/dns 6ebcb714d36901126ee2807031543b38c56de963"
	"github.com/ovh/go-ovh d2207178e10e4527e8f222fd8707982df8c3af17"
	"github.com/pyr/egoscale 987e683a7552f34ee586217d1cc8507d52e80ab9"
	"github.com/rainycape/memcache 1031fa0ce2f20c1c0e1e1b51951d8ea02c84fa05"
	"github.com/timewasted/linode 37e84520dcf74488f67654f9c775b9752c232dc1"
	"github.com/urfave/cli 8ba6f23b6e36d03666a14bd9421f5e3efcb59aca"
	"golang.org/x/crypto cbc3d0884eac986df6e78a039b8792e869bff863 github.com/golang/crypto"
	"golang.org/x/net 5602c733f70afc6dcec6766be0d5034d4c4f14de github.com/golang/net"
	"golang.org/x/oauth2 a6bd8cefa1811bd24b86f8902872e4e8225f74c4 github.com/golang/oauth2"
	"cloud.google.com/go 1ec09e65be459e9a0c9014ff8e4591d8c2f1bed6 github.com/GoogleCloudPlatform/google-cloud-go"
	"google.golang.org/api 16ab375f94503bfa0d19db78e96bffbe1a34354f github.com/google/google-api-go-client"
	"gopkg.in/ini.v1 e7fea39b01aea8d5671f6858f0532f56e8bff3a5 github.com/go-ini/ini"
	"gopkg.in/ns1/ns1-go.v2 2abc76c60bf88ba33b15d1d87a13f624d8dff956 github.com/ns1/ns1-go"
	"gopkg.in/square/go-jose.v1 bd0247f8b50d7aa466c4a140dd4ce7a1419cdba4 github.com/square/go-jose" )

inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/xenolf/lego/..."
GIT_COMMIT="5dfe609afb1ebe9da97c9846d97a55415e5a5ccd"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Let's Encrypt client and ACME library written in Go"
HOMEPAGE="https://github.com/xenolf/lego"
SRC_URI="${ARCHIVE_URI}
	${EGO_VENDOR_URI}"
LICENSE="MIT"
SLOT="0"
IUSE=""

src_compile() {
	pushd src/${EGO_PN%/*} || die
	GOPATH="${WORKDIR}/${P}" go build -o bin/lego || die
	popd || die
}

src_install() {
	pushd src/${EGO_PN%/*} || die
	dobin bin/*
	popd || die
}
