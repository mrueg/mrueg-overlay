# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit autotools python-single-r1 vala

DESCRIPTION="Framework for writing networked applications"
HOMEPAGE="https://github.com/haiwen/ccnet http://www.seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="client examples ldap server static-libs"

RDEPEND="dev-libs/glib:2
	dev-libs/libevent
	dev-libs/openssl:0
	dev-db/sqlite:3
	net-libs/libsearpc[${PYTHON_USEDEP}]
	ldap? ( net-nds/openldap )
	server? ( dev-db/libzdb )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	$(vala_depend)"

src_prepare() {
	sed -i -e "s/(DESTDIR)//" libccnet.pc.in || die
	eautoreconf
	vala_src_prepare
	sed -i -e 's/valac /${VALAC} /' lib/Makefile.am || die
}

src_configure() {
	econf \
		$(use_enable client) \
		$(use_enable examples compile-demo) \
		$(use_enable server) \
		$(use_enable static-libs static-build)
}
