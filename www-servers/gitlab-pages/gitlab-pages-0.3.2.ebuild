# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGO_PN="gitlab.com/gitlab-org/${PN}/..."

inherit golang-build golang-vcs-snapshot

COMMIT="7285dc"

DESCRIPTION="A smart reverse proxy for GitLab written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-pages"
SRC_URI="https://gitlab.com/gitlab-org/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
IUSE=""

src_compile() {
	pushd src/${EGO_PN%/*} || die
	GOPATH="${WORKDIR}/${P}" go build -o ${PN} --ldflags="-X main.VERSION=${PV} -X main.REVISION=${COMMIT}" || die
	popd || die
}

src_install() {
	dobin src/${EGO_PN%/*}/${PN}
	dodoc src/${EGO_PN%/*}/CHANGELOG src/${EGO_PN%/*}/README.md
}
