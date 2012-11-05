# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools

MY_P=${PN}-xkbcommon-${PV}

DESCRIPTION="Keyboard handling library using XKB data"
HOMEPAGE="http://cgit.freedesktop.org/xorg/lib/libxkbcommon"
SRC_URI="http://cgit.freedesktop.org/xorg/lib/${PN}/snapshot/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-proto/xproto
	>=x11-proto/kbproto-1.0.5"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex"

S="${WORKDIR}"/${MY_P}

src_prepare(){
	eautoreconf
}
