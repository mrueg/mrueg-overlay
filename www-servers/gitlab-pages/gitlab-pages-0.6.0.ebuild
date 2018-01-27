# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="gitlab.com/gitlab-org/${PN}"

inherit golang-build golang-vcs-snapshot

COMMIT="0173d4e6"

DESCRIPTION="Simple HTTP server serving GitLab Pages with CNAMEs and SNI using HTTP/HTTP2"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-pages"
SRC_URI="https://gitlab.com/gitlab-org/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
IUSE=""

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${WORKDIR}/${P}" go build -o ${PN} --ldflags="-X main.VERSION=${PV} -X main.REVISION=${COMMIT}" || die
	popd || die
}

src_install() {
	dobin src/${EGO_PN}/${PN}
	dodoc src/${EGO_PN}/{CHANGELOG,README.md}
}
