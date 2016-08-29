# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Top-like PostgreSQL statistics viewer"
HOMEPAGE="https://github.com/lesovsky/pgcenter"
COMMIT_ID="47817b5f9c597b5ad12779a0c42d59d05634ac3f"
SRC_URI="https://github.com/lesovsky/pgcenter/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-db/postgresql:=
	sys-libs/ncurses:="
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}-${COMMIT_ID}

src_install() {
	default
	newman doc/pgcenter.1 pgcenter
	dodoc doc/Changelog
}
