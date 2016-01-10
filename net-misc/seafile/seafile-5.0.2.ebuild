# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit autotools python-single-r1 vala

DESCRIPTION="Cloud storage system with features on privacy protection and teamwork"
HOMEPAGE="https://github.com/haiwen/seafile http://www.seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="client fuse riak server static-libs"

RDEPEND="dev-libs/glib:2
	dev-libs/jansson
	dev-libs/libevent
	dev-libs/openssl:0
	dev-db/sqlite:3
	net-libs/ccnet[${PYTHON_USEDEP},client?,server?]
	net-libs/libsearpc[${PYTHON_USEDEP}]
	client? ( net-misc/curl )
	fuse? ( sys-fs/fuse )
	server? ( app-arch/libarchive
		dev-db/libzdb
		net-libs/libevhtp )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	$(vala_depend)"

src_prepare() {
	eautoreconf
	vala_src_prepare
	sed -i -e 's/valac /${VALAC} /' lib/Makefile.am || die
}

src_configure() {
	econf \
		$(use_enable client) \
		$(use_enable fuse) \
		$(use_enable riak) \
		$(use_enable server) \
		$(use_enable static-libs static-build)
}
