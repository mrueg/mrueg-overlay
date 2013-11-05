# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools multilib eutils git-r3

DESCRIPTION="Free as in freedom Skype replacement"
HOMEPAGE="http://tox.im/"
EGIT_REPO_URI="https://github.com/irungentoo/ProjectTox-Core.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="+dht-bootstrap-daemon -nacl +ntox static-libs test"

RDEPEND="
	dht-bootstrap-daemon? ( dev-libs/libconfig )
	!nacl? ( dev-libs/libsodium )
	ntox? ( sys-libs/ncurses )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nacl? ( net-libs/nacl )
	test? ( dev-libs/check )"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable nacl) \
		$(use_enable test tests) \
		$(use_enable ntox) \
		$(use_enable dht-bootstrap-daemon) \
		$(use_enable static-libs static) \
		--with-nacl-headers=/usr/include/nacl \
		--with-nacl-libs=/usr/$(get_libdir)/nacl
}

src_install() {
	default
	prune_libtool_files
}

pkg_postinst() {
	elog "DHT node list is available via https://gist.github.com/Proplex/6124860"
	elog "or in #tox @ irc.freenode.org"
}
