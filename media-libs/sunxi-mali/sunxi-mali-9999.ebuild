# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="https://github.com/linux-sunxi/${PN}.git"
inherit multilib xorg-2 toolchain-funcs

DESCRIPTION="Proprietary Mali userspace driver"
HOMEPAGE="https://github.com/linux-sunxi/sunxi-mali"
LICENSE="all-rights-reserved"
KEYWORDS=""
IUSE=""

CDEPEND="x11-libs/libump"
DEPEND="virtual/pkgconfig
	${CDEPEND}"
RDEPEND="app-eselect/eselect-opengl
	${CDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-glchar-pkgconfig.patch
	cp "${FILESDIR}"/mali_clz_lut_dump.c . || die
}

src_configure() {
	emake config VERSION=r3p2-01rel1
}

src_compile() {
	MALI_DIR="lib/mali/r3p2-01rel1/armhf/x11/"
	# Hack around due to missing _mali_clz_lut 
	ln -s libGLESv2.so.2.0 ${MALI_DIR}/libGLESv2.so || die
	$(tc-getCC) ${CFLAGS} mali_clz_lut_dump.c -L${MALI_DIR} -lGLESv2 -lMali || die
	LD_LIBRARY_PATH="${MALI_DIR}" ./a.out > fake_mali_clz_lut.c || die
	$(tc-getCC) -fPIC -shared ${CFLAGS} -o ${MALI_DIR}/libfake_mali_clz_lut.so fake_mali_clz_lut.c || die
	cd ${MALI_DIR} || die
	mv libEGL.so.1.4 libEGL_Mali.so || die
	$(tc-getCC) --shared -Wl,--no-as-needed -L. -lEGL_Mali -lfake_mali_clz_lut -o libEGL.so.1.4 || die
}

src_install() {
	dodir /usr/$(get_libdir)/opengl/${PN}/{lib,include}
	touch "${D}"/usr/$(get_libdir)/opengl/${PN}/.gles-only || die
	emake DESTDIR="${D}" prefix="/usr/$(get_libdir)/opengl/${PN}/" install
	insinto /usr/$(get_libdir)/opengl/${PN}/lib
	doins ${MALI_DIR}/libEGL_Mali.so ${MALI_DIR}/libfake_mali_clz_lut.so
	insinto /lib/udev/rules.d
	doins "${FILESDIR}"/50-mali.rules
}

src_test() {
	emake test
	./test/test || die
}
