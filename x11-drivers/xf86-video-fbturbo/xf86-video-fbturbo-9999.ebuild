# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-fbdev/xf86-video-fbdev-0.4.4.ebuild,v 1.10 2014/03/28 01:53:49 jer Exp $

EAPI=5

EGIT_REPO_URI="https://github.com/ssvb/${PN}.git"
EGIT_BRANCH="mali-r3p2-support"
inherit xorg-2

DESCRIPTION="Drop-in replacement for xf86-video-fbdev and xf86-video-mali providing a better performance on ARM"
HOMEPAGE="https://github.com/ssvb/xf86-video-fbturbo"
LICENSE="MIT GPL-2+"
KEYWORDS=""
IUSE="ump"

RDEPEND="x11-base/xorg-server
	x11-libs/libdrm
	x11-libs/libump
	x11-libs/pixman"
DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xf86driproto
	x11-proto/xproto"

src_configure() {
	econf --enable-libump=$(usex ump)
}
