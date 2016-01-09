# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit autotools python-single-r1

DESCRIPTION="RPC framework to handle the serialization/deserialization part of RPC"
HOMEPAGE="https://github.com/haiwen/libsearpc http://www.seafile.com"
SRC_URI="https://github.com/haiwen/libsearpc/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/glib:2
	dev-libs/jansson"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	sed -i -e "s/(DESTDIR)//" libsearpc.pc.in || die
	eautoreconf
}
