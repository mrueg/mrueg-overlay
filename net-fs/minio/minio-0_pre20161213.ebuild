# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit golang-build golang-vcs-snapshot

VERSION="2016-12-13T17-19-42Z"
EGO_PN="github.com/minio/minio/..."
EGIT_COMMIT="29d72b84c07f9555f83a6485fe8291e18d23811b"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="An Amazon S3 compatible object storage server"
HOMEPAGE="https://github.com/minio/minio"
SRC_URI="${ARCHIVE_URI}"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RESTRICT="test"

src_prepare() {
	default
	sed -i -e "s/time.Now().UTC().Format(time.RFC3339)/\"${VERSION}\"/" src/${EGO_PN%/*}/buildscripts/gen-ldflags.go || die
}

src_compile() {
	pushd src/${EGO_PN%/*} || die
	GOPATH="${S}" go build --ldflags "$(go run buildscripts/gen-ldflags.go)" -o minio || die
	popd || die
}

src_install() {
	pushd src/${EGO_PN%/*} || die
	dodoc -r README.md CONTRIBUTING.md MAINTAINERS.md docs
	dobin minio
	popd  || die
}
