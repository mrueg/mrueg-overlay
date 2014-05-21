# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-fbdev/xf86-video-fbdev-0.4.4.ebuild,v 1.10 2014/03/28 01:53:49 jer Exp $

EAPI=5
inherit xorg-2

SRC_URI="https://github.com/ssvb/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Drop-in replacement for xf86-video-fbdev and xf86-video-mali providing a better performance on ARM"
KEYWORDS="~amd64 ~arm"
IUSE=""

RDEPEND="x11-base/xorg-server"
DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xproto"
