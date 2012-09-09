# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils toolchain-funcs

DESCRIPTION="Software for simulating MobileRobots/ActivMedia platforms"
HOMEPAGE="http://robots.mobilerobots.com/wiki/MobileSim"

MY_PN="MobileSim"
SRC_URI="http://robots.mobilerobots.com/${MY_PN}/download/current/${MY_PN}-src-${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/gtk+:2"
DEPEND="${RDEPEND}
	sys-devel/libtool
	virtual/pkgconfig"

S=${WORKDIR}/${MY_PN}-src-${PV}

src_prepare() {
	epatch "${FILESDIR}"/${P}-Makefile.patch \
		"${FILESDIR}"/${P}-gentoo.patch
	tc-export CC CXX
}

src_compile() {
	# Package has parallel compilation issues
	emake -j1
}
