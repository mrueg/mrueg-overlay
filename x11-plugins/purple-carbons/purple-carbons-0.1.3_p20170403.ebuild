# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot toolchain-funcs

COMMIT="35dd48de17003ba9d17e2b413bc6d762d506d0fc"
DESCRIPTION="Experimental XEP-0280: Message Carbons plugin for libpurple"
HOMEPAGE="https://github.com/gkdr/carbons"
SRC_URI="https://github.com/gkdr/carbons/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="net-im/pidgin
	dev-libs/glib:2
	dev-libs/libxml2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	default
	sed -i -e 's/gcc/$(CC)/'\
		-e "s#\~/.purple/plugins#\$(DESTDIR)/usr/$(get_libdir)/pidgin/#"\
		makefile || die
}

src_compile() {
	CC=$(tc-getCC) emake
}
