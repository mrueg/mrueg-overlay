# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Top-like PostgreSQL statistics viewer"
HOMEPAGE="https://github.com/lesovsky/pgcenter"
SRC_URI="https://github.com/lesovsky/pgcenter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-db/postgresql:=
	sys-libs/ncurses:="
DEPEND="${RDEPEND}"

src_install() {
	default
	newman doc/pgcenter.1 pgcenter
	dodoc doc/Changelog
}
