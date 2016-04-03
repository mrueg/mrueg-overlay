# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-base golang-vcs-snapshot

EGO_SRC=gitlab.com/gitlab-org/${PN}
EGO_PN=${EGO_SRC}/...

ARCHIVE_URI="https://${EGO_SRC}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A smart reverse proxy for GitLab written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-workhorse"
SRC_URI="${ARCHIVE_URI}"
LICENSE="MIT"
SLOT="0/${PVR}"
IUSE=""

RESTRICT="test"

src_compile() {
	pushd src/$EGO_SRC || die
	emake
	popd
}

src_install() {
	pushd src/${EGO_SRC} || die
	dodoc CHANGELOG README.md
	emake install PREFIX="${D}"/usr
	popd
}
