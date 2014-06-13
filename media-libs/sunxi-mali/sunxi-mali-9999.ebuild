# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-fbdev/xf86-video-fbdev-0.4.4.ebuild,v 1.10 2014/03/28 01:53:49 jer Exp $

EAPI=5

EGIT_REPO_URI="https://github.com/linux-sunxi/${PN}.git"
inherit multilib xorg-2

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
	epatch "${FILESDIR}"/${PN}-glchar-pkgconfig.patch
	cp "${FILESDIR}"/mali_clz_lut_dump.c . || die
}

src_configure() {
	emake config
	VERSION=$( ./version/version )
}

src_compile() {
	MALI_DIR="lib/mali/${VERSION}/armhf/x11/"
	# Hack around due to missing _mali_clz_lut 
	$(CC) $(CFLAGS) mali_clz_lut_dump.c -lGLESv2 || die
	./a.out fake_mali_clz_lut.c || die
	$(CC) -fPIC -shared $(CFLAGS) -o ${MALI_DIR}/fake_mali_clz_lut.so fake_mali_clz_lut.c || die
	cd ${MALI_DIR} || die
	mv libEGL.so.1.4 libEGL_Mali.so || die
	$(CC) --shared W1,--no-as-needed -lEGL_Mali -lfake_mali_clz_lut -o libEGL.so.1.4 || die
}

src_install() {
	dodir /usr/$(get_libdir)/opengl/${PN}/{lib,include}
	touch "${D}"/usr/$(get_libdir)/opengl/${PN}/.gles-only || die
	emake DESTDIR="${D}" prefix="/usr/$(get_libdir)/opengl/${PN}/" install
	insinto /usr/$(get_libdir)/opengl/${PN}/lib
	doins ${MALI_DIR}/libEGL_Mali.so ${MALI_DIR}/fake_mali_clz_lut.so
	dodir /etc/udev/rules.d
	insinto /etc/udev/rules.d
	doins "${FILESDIR}"/50-mali.rules
}

src_test() {
	emake test
	./test/test || die
}
