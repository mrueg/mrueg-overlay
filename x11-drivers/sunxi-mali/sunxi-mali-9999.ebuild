# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-fbdev/xf86-video-fbdev-0.4.4.ebuild,v 1.10 2014/03/28 01:53:49 jer Exp $

EAPI=5

EGIT_REPO_URI="https://github.com/linux-sunxi/${PN}.git"
inherit xorg-2

DESCRIPTION="Proprietary Mali userspace driver"
HOMEPAGE="https://github.com/linux-sunxi/sunxi-mali"
LICENSE="all-rights-reserved"
KEYWORDS=""
IUSE=""

RDEPEND="x11-libs/libump"
DEPEND="${RDEPEND}"

src_configure() {
	emake config
}

src_test() {
	emake test
	./test/test || die
}
