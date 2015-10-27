# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

WX_GTK_VER="3.0"

inherit eutils flag-o-matic wxwidgets

MY_PV="${PV/_beta/BETA}"
DESCRIPTION="Password manager with wxGTK based frontend"
HOMEPAGE="http://pwsafe.org/ https://github.com/pwsafe/pwsafe/"
SRC_URI="https://github.com/pwsafe/pwsafe/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="minimal yubikey"

RDEPEND="dev-libs/xerces-c
	sys-apps/util-linux
	sys-devel/gettext
	x11-libs/libXt
	x11-libs/libXtst
	x11-libs/wxGTK:${WX_GTK_VER}[X]
	!minimal? ( !!app-misc/pwsafe )
	yubikey? ( sys-auth/ykpers )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/pwsafe-${MY_PV}

pkg_pretend() {
	einfo "Checking for -std=c++11 support in compiler"
	test-flags-CXX -std=c++11 > /dev/null || die
}

src_prepare() {
	# remove hard coded compilers and compiler flags
	sed -e '/^export CXXFLAGS/d' -i Makefile.linux || die
	sed -i src/core/Makefile src/os/linux/Makefile src/ui/wxWidgets/Makefile \
		-e 's/-O[0-3]\?//g' -e 's/-g(gdb)\?//g' \
		-e '/^CC=/d' -e '/^CXX=/d' || die

	# generator for the version.h only adds \r breaking the c file
	cp src/ui/wxWidgets/version.in src/ui/wxWidgets/version.h || die

	# binary name pwsafe is in use by app-misc/pwsafe, we use passwordsafe
	# instead. Perform required changes in linking files
	sed -i install/desktop/pwsafe.desktop -e "s/pwsafe/${PN}/g" || die
	sed -i docs/pwsafe.1 \
		-e 's/PWSAFE/PASSWORDSAFE/' \
		-e "s/^.B pwsafe/.B ${PN}/" || die
}

src_configure() {
	if ! use yubikey ; then
		export NO_YUBI=1
	fi

	need-wxwidgets unicode

	strip-flags
	append-cxxflags -std=c++11
}

src_compile() {
	emake unicoderelease help I18N
}

src_install() {
	if use minimal; then
		newbin src/ui/wxWidgets/GCCUnicodeRelease/pwsafe ${PN}
	else
		dobin src/ui/wxWidgets/GCCUnicodeRelease/pwsafe
		dosym pwsafe /usr/bin/${PN}
	fi

	newman docs/pwsafe.1 ${PN}.1

	dodoc README.txt docs/{ReleaseNotes.txt,ChangeLog.txt}

	insinto /usr/share/pwsafe/xml
	doins xml/*

	insinto /usr/share/locale
	doins -r src/ui/wxWidgets/I18N/mos/*

	# The upstream Makefile builds this .zip file from html source material for
	# use by the package's internal help system. Must prevent
	# Portage from applying additional compression.
	docompress -x /usr/share/doc/${PN}/help
	insinto /usr/share/doc/${PN}/help
	doins help/*.zip

	newicon install/graphics/pwsafe.png ${PN}.png
	newmenu install/desktop/pwsafe.desktop ${PN}.desktop
}
