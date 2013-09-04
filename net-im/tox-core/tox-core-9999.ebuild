# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/irungentoo/ProjectTox-Core"

inherit git-2 multilib autotools-utils

DESCRIPTION="Free as in freedom Skype replacement"
HOMEPAGE="http://tox.im"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/check
	dev-libs/libconfig
	sys-libs/ncurses
	net-libs/libsodium"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eautoreconf
}

src_install() {
	default
	cd "${BUILD_DIR}" || die
	insinto /usr/$(get_libdir)/pkgconfig
	doins libtoxcore.pc
	ls -lisa
	local binaries=(
		crypto_speed_test
		crypto_test
		DHT_test
		DHT_bootstrap
		DHT_bootstrap_daemon
		Lossless_UDP_testclient
		Lossless_UDP_testserver
		Messenger_test
		messenger_autotest
		nTox
	)
	dobin ${binaries[@]/#/build/}
	dolib build/.libs/libtoxcore$(get_libname)
}

pkg_postinst() {
	elog "DHT node list is available via https://gist.github.com/Proplex/6124860"
	elog "or in #tox @ irc.freenode.org"
}
