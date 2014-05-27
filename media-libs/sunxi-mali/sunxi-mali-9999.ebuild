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

CDEPEND="x11-libs/libump"
DEPEND="virtual/pkgconfig
	${CDEPEND}"
RDEPEND="
	app-admin/eselect-opengl
	${CDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-glchar-pkgconfig.patch
}

src_configure() {
	emake config
}

src_compile() {
	:;
}

src_install() {
	dodir /usr/lib/opengl/${PN}/{lib,include}
	emake DESTDIR="${D}" prefix="/usr/lib/opengl/${PN}/" install
}

src_test() {
	emake test
	./test/test || die
}

pkg_postinst() {
	elog "Don't forget to add a udev-rule for mali"
	elog ""
	elog "Put this into /etc/udev/rules.d/50-mali.rules"
	elog "KERNEL==\"mali\", MODE=\"0660\", GROUP=\"video\""
	elog "KERNEL==\"ump\", MODE=\"0660\", GROUP=\"video\""
}
