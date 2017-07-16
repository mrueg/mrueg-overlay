# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_PN="gitlab.com/gitlab-org/gitaly"

inherit golang-vcs-snapshot

DESCRIPTION="A Git RPC service for handling all the git calls made by GitLab"
HOMEPAGE="https://gitlab.com/gitlab-org/gitaly"
SRC_URI="https://${EGO_PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	sed -i -e "s/git describe/echo ${PV}/" src/${EGO_PN}/Makefile || die
}

src_compile() {
	emake -C src/${EGO_PN} build
}

src_install() {
	pushd src/${EGO_PN} || die
	insinto /etc/gitaly
	doins config.toml.example
	dodoc -r doc README.md CHANGELOG.md
	dobin _build/bin/${PN}
	popd || die
}
