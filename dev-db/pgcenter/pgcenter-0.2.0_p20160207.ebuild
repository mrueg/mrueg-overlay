# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Top-like PostgreSQL statistics viewer"
HOMEPAGE="https://github.com/lesovsky/pgcenter"
COMMIT_ID="ef47c572a91e243bdd8b6025033185afad44aad1"
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
