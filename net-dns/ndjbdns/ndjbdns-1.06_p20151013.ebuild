# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools vcs-snapshot

DESCRIPTION="Fork of djbdns a collection of DNS client/server software"
HOMEPAGE="http://pjp.dgplug.org/djbdns/index.html"
COMMIT_ID="64d371b6f887621de7bf8bd495be10442b2accd0"
SRC_URI="https://github.com/pjps/${PN}/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="!!net-dns/djbdns
	!!sys-apps/ucspi-tcp"

src_prepare() {
	sed -i -e '/^AM_CFLAGS/s|-g -O2 ||g' Makefile.am || die
	sed -i -e 's#/rc.d##' etc/init.d/Makefile.am || die
	eautoreconf
}
