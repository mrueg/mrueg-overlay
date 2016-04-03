# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-base vcs-snapshot

DESCRIPTION="A smart reverse proxy for GitLab written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-workhorse"
SRC_URI="https://gitlab.com/gitlab-org/gitlab-workhorse/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0/${PVR}"
IUSE=""

RESTRICT="test"

src_prepare() {
	sed -i -e 's/VERSION=.*/VERSION=${PV}/' Makefile || die
}

src_install() {
	dodoc CHANGELOG README.md
	emake install PREFIX="${D}"/usr
}
