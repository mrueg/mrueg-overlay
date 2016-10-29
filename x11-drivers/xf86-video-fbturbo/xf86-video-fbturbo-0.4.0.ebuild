# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit xorg-2

SRC_URI="https://github.com/ssvb/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Better performing replacement for xf86-video-fbdev and xf86-video-mali"
HOMEPAGE="https://github.com/ssvb/xf86-video-fbturbo"
LICENSE="MIT GPL-2+"
KEYWORDS="~arm"
IUSE=""

RDEPEND="x11-base/xorg-server
	x11-libs/libdrm
	x11-libs/pixman"
DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xf86driproto
	x11-proto/xproto"
