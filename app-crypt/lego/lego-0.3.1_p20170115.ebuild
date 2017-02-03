# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/xenolf/lego/..."
GIT_COMMIT="f5d538caab6dc0c167d4e32990c79bbf9eff578c"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Let's Encrypt client and ACME library written in Go"
HOMEPAGE="https://github.com/xenolf/lego"
SRC_URI="${ARCHIVE_URI}
	https://github.com/Azure/azure-sdk-for-go/archive/d05c22dc3f9fdd2ec6e3593839fdd44df17f2de5.tar.gz -> Azure-azure-sdk-for-go-d05c22dc3f9fdd2ec6e3593839fdd44df17f2de5.tar.gz
	https://github.com/Azure/go-autorest/archive/c32ee194f47ffceb471abc73a222edf76895c7e9.tar.gz -> Azure-go-autorest-c32ee194f47ffceb471abc73a222edf76895c7e9.tar.gz
	https://github.com/JamesClonk/vultr/archive/9ec0427d51411407c0402b093a1771cb75af9679.tar.gz -> JamesClonk-vultr-9ec0427d51411407c0402b093a1771cb75af9679.tar.gz
	https://github.com/aws/aws-sdk-go/archive/2ae1f45d01cdc7316a4d6c518c21a6d9d81a4970.tar.gz -> aws-aws-sdk-go-2ae1f45d01cdc7316a4d6c518c21a6d9d81a4970.tar.gz
	https://github.com/decker502/dnspod-go/archive/68650ee11e182e30773781d391c66a0c80ccf9f2.tar.gz -> decker502-dnspod-go-68650ee11e182e30773781d391c66a0c80ccf9f2.tar.gz
	https://github.com/dgrijalva/jwt-go/archive/a601269ab70c205d26370c16f7c81e9017c14e04.tar.gz -> dgrijalva-jwt-go-a601269ab70c205d26370c16f7c81e9017c14e04.tar.gz
	https://github.com/edeckers/auroradnsclient/archive/8b777c170cfd377aa16bb4368f093017dddef3f9.tar.gz -> edeckers-auroradnsclient-8b777c170cfd377aa16bb4368f093017dddef3f9.tar.gz
	https://github.com/ovh/go-ovh/archive/d2207178e10e4527e8f222fd8707982df8c3af17.tar.gz -> ovh-go-ovh-d2207178e10e4527e8f222fd8707982df8c3af17.tar.gz
	https://github.com/pyr/egoscale/archive/9ee3ef584c468e35d3aea09fb96beda7cc139843.tar.gz -> pyr-egoscale-9ee3ef584c468e35d3aea09fb96beda7cc139843.tar.gz
	https://github.com/rainycape/memcache/archive/1031fa0ce2f20c1c0e1e1b51951d8ea02c84fa05.tar.gz -> rainycape-memcache-1031fa0ce2f20c1c0e1e1b51951d8ea02c84fa05.tar.gz
	https://github.com/timewasted/linode/archive/37e84520dcf74488f67654f9c775b9752c232dc1.tar.gz -> timewasted-linode-37e84520dcf74488f67654f9c775b9752c232dc1.tar.gz
	https://github.com/urfave/cli/archive/347a9884a87374d000eec7e6445a34487c1f4a2b.tar.gz -> urfave-cli-347a9884a87374d000eec7e6445a34487c1f4a2b.tar.gz
	https://github.com/weppos/dnsimple-go/archive/65c1ca73cb19baf0f8b2b33219b7f57595a3ccb0.tar.gz -> weppos-dnsimple-go-65c1ca73cb19baf0f8b2b33219b7f57595a3ccb0.tar.gz
	https://github.com/miekg/dns/archive/b6ecf29d9812d2c4a8c200dd736d275bb74b981e.tar.gz -> miekg-dns-b6ecf29d9812d2c4a8c200dd736d275bb74b981e.tar.gz
	https://github.com/golang/net/archive/007e530097ad7f954752df63046b4036f98ba6a6.tar.gz -> golang-net-007e530097ad7f954752df63046b4036f98ba6a6.tar.gz
	https://github.com/golang/crypto/archive/bed12803fa9663d7aa2c2346b0c634ad2dcd43b7.tar.gz -> golang-crypto-bed12803fa9663d7aa2c2346b0c634ad2dcd43b7.tar.gz
	https://github.com/golang/oauth2/archive/314dd2c0bf3ebd592ec0d20847d27e79d0dbe8dd.tar.gz -> golang-oauth2-314dd2c0bf3ebd592ec0d20847d27e79d0dbe8dd.tar.gz
	https://github.com/go-ini/ini/archive/e3c2d47c61e5333f9aa2974695dd94396eb69c75.tar.gz -> go-ini-ini-e3c2d47c61e5333f9aa2974695dd94396eb69c75.tar.gz
	https://github.com/ns1/ns1-go/archive/213359381aff9486faa74f98e3d9afd4c566ebfd.tar.gz -> ns1-ns1-go-213359381aff9486faa74f98e3d9afd4c566ebfd.tar.gz
	https://github.com/square/go-jose/archive/aa2e30fdd1fe9dd3394119af66451ae790d50e0d.tar.gz -> square-go-jose-aa2e30fdd1fe9dd3394119af66451ae790d50e0d.tar.gz
	https://github.com/GoogleCloudPlatform/google-cloud-go/archive/3258e6905e9694db9bcd41910c65ecc30ae6dbbe.tar.gz -> GoogleCloudPlatform-google-cloud-go-3258e6905e9694db9bcd41910c65ecc30ae6dbbe.tar.gz
	https://github.com/googleapis/gax-go/archive/da06d194a00e19ce00d9011a13931c3f6f6887c7.tar.gz -> googleapis-gax-go-da06d194a00e19ce00d9011a13931c3f6f6887c7.tar.gz
	https://github.com/grpc/grpc-go/archive/21f8ed309495401e6fd79b3a9fd549582aed1b4c.tar.gz -> grpc-grpc-go-21f8ed309495401e6fd79b3a9fd549582aed1b4c.tar.gz
	https://github.com/golang/protobuf/archive/8ee79997227bf9b34611aee7946ae64735e6fd93.tar.gz -> golang-protobuf-8ee79997227bf9b34611aee7946ae64735e6fd93.tar.gz
	https://github.com/google/google-api-go-client/archive/c55f685368bb1cdfed2c20283e2878a83b929730.tar.gz -> google-google-api-go-client-c55f685368bb1cdfed2c20283e2878a83b929730.tar.gz"
LICENSE="MIT"
SLOT="0"
IUSE=""

_golang-include-src() {
	local VENDORPN=$1 TARBALL=$2
	mkdir -p "${WORKDIR}/${P}/src/${VENDORPN}" || die
	tar -C "${WORKDIR}/${P}/src/${VENDORPN}" -x --strip-components 1\
		-f "${DISTDIR}"/${TARBALL} || die
}

src_unpack() {
	golang-vcs-snapshot_src_unpack
	_golang-include-src github.com/Azure/azure-sdk-for-go Azure-azure-sdk-for-go-*.tar.gz
	_golang-include-src github.com/Azure/go-autorest Azure-go-autorest-*.tar.gz
	_golang-include-src github.com/JamesClonk/vultr JamesClonk-vultr-*.tar.gz
	_golang-include-src github.com/aws/aws-sdk-go aws-aws-sdk-go-*.tar.gz
	_golang-include-src github.com/decker502/dnspod-go decker502-dnspod-go-*.tar.gz
	_golang-include-src github.com/dgrijalva/jwt-go dgrijalva-jwt-go-*.tar.gz
	_golang-include-src github.com/edeckers/auroradnsclient edeckers-auroradnsclient-*.tar.gz
	_golang-include-src github.com/ovh/go-ovh ovh-go-ovh-*.tar.gz
	_golang-include-src github.com/pyr/egoscale pyr-egoscale-*.tar.gz
	_golang-include-src github.com/rainycape/memcache rainycape-memcache-*.tar.gz
	_golang-include-src github.com/timewasted/linode timewasted-linode-*.tar.gz
	_golang-include-src github.com/urfave/cli urfave-cli-*.tar.gz
	_golang-include-src github.com/weppos/dnsimple-go weppos-dnsimple-go-*.tar.gz
	_golang-include-src github.com/miekg/dns miekg-dns-*.tar.gz
	_golang-include-src golang.org/x/net golang-net-*.tar.gz
	_golang-include-src golang.org/x/crypto golang-crypto-*.tar.gz
	_golang-include-src golang.org/x/oauth2 golang-oauth2-*.tar.gz
	_golang-include-src gopkg.in/ini.v1 go-ini-ini-*.tar.gz
	_golang-include-src gopkg.in/ns1/ns1-go.v2 ns1-ns1-go-*.tar.gz
	_golang-include-src gopkg.in/square/go-jose.v1 square-go-jose-*.tar.gz
	_golang-include-src cloud.google.com/go GoogleCloudPlatform-google-cloud-go-*.tar.gz
	_golang-include-src github.com/googleapis/gax-go googleapis-gax-go-*.tar.gz
	_golang-include-src google.golang.org/grpc grpc-grpc-go-*.tar.gz
	_golang-include-src github.com/golang/protobuf golang-protobuf-*.tar.gz
	_golang-include-src google.golang.org/api google-google-api-go-client-*.tar.gz
}

src_compile() {
	GOPATH="${WORKDIR}/${P}" go install -v -work -x ${EGO_PN} || die
}

src_install() {
	dobin bin/*
}
