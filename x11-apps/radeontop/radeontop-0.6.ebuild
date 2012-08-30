# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils vcs-snapshot toolchain-funcs

DESCRIPTION="View your GPU utilization, both for the total activity percent and individual blocks"
HOMEPAGE="https://github.com/clbr/radeontop"
SRC_URI="https://github.com/clbr/${PN}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nls"

DEPEND="sys-libs/ncurses
	x11-libs/libpciaccess"
RDEPEND="${DEPEND}"

src_prepare(){
	tc-export CC
	epatch "${FILESDIR}"/${P}-Makefile.patch "${FILESDIR}"/${P}-dump.patch
	cp "${FILESDIR}"/version.h include/version.h
	sed -e 's:#define VERSION "":#define VERSION "'${PV}'":' -i include/version.h || die
}

src_compile(){
	emake $(usex nls "nls=1" "")
}
