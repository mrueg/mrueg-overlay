# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools

DESCRIPTION="Fork of djbdns a collection of DNS client/server software"
HOMEPAGE="http://pjp.dgplug.org/djbdns/index.html"
SRC_URI="http://pjp.dgplug.org/djbdns/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_prepare() {
	sed -i -e '/^AM_CFLAGS/s|-g -O2 ||g' Makefile.am || die
	sed -i -e 's#/rc.d##' etc/init.d/Makefile.in || die
	eautoreconf
}
