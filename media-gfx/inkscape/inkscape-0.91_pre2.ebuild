# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/inkscape/inkscape-0.48.5.ebuild,v 1.1 2014/06/26 06:56:30 radhermit Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="xml"
GCONF_DEBUG=no

inherit autotools eutils flag-o-matic gnome2 toolchain-funcs python-single-r1

MY_P=${P/_/}

DESCRIPTION="A SVG based generic vector-drawing program"
HOMEPAGE="http://www.inkscape.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x86-solaris"
IUSE="cdr dia dbus gnome postscript inkjar lcms nls spell visio wmf"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="
	${PYTHON_DEPS}
	|| (
		( app-text/libwpd:0.9 app-text/libwpg:0.2 )
		( app-text/libwpg:0.3 dev-libs/librevenge )
	)
	>=app-text/poppler-0.26.0:=[cairo,xpdf-headers(+)]
	>=dev-cpp/glibmm-2.28
	>=dev-cpp/gtkmm-2.18.0:2.4
	>=dev-cpp/cairomm-1.9.8
	>=dev-cpp/glibmm-2.32
	>=dev-libs/boehm-gc-6.4
	>=dev-libs/glib-2.28
	>=dev-libs/libsigc++-2.0.12
	>=dev-libs/libxml2-2.6.20
	>=dev-libs/libxslt-1.0.15
	dev-libs/popt
	dev-python/lxml[${PYTHON_USEDEP}]
	media-gfx/imagemagick[cxx]
	media-libs/fontconfig
	media-libs/freetype:2
	media-libs/libexif
	media-libs/libpng:0
	sci-libs/gsl
	x11-libs/libX11
	>=x11-libs/gtk+-2.10.7:2
	>=x11-libs/pango-1.32.4
	cdr? ( media-libs/libcdr )
	dbus? ( dev-libs/dbus-glib )
	gnome? ( >=gnome-base/gnome-vfs-2.0 )
	lcms? ( media-libs/lcms:2 )
	spell? (
		app-text/aspell
		app-text/gtkspell:2
	)
	visio? ( media-libs/libvisio )"

# These only use executables provided by these packages
# See share/extensions for more details. inkscape can tell you to
# install these so we could of course just not depend on those and rely
# on that.
RDEPEND="${COMMON_DEPEND}
	dev-python/numpy[${PYTHON_USEDEP}]
	media-gfx/uniconvertor
	dia? ( app-office/dia )
	postscript? ( app-text/ghostscript-gpl )
	wmf? ( media-libs/libwmf )"

DEPEND="${COMMON_DEPEND}
	>=dev-libs/boost-1.36
	>=dev-util/intltool-0.40
	>=sys-devel/gettext-0.17
	virtual/pkgconfig"

S=${WORKDIR}/${MY_P}

RESTRICT="test"

src_prepare() {
	gnome2_src_prepare
	epatch \
		"${FILESDIR}"/${P}-spell.patch \
		"${FILESDIR}"/${PN}-0.48.3.1-desktop.patch \
		"${FILESDIR}"/${PN}-0.48.4-epython.patch

	sed -i \
		-e "s#@EPYTHON@#${EPYTHON}#" \
		src/extension/implementation/script.cpp || die

	eautoreconf

	# bug 421111
	python_fix_shebang share/extensions
}

src_configure() {
	G2CONF="${G2CONF}
		--enable-poppler-cairo
		$(use_with gnome gnome-vfs)
		$(use_with inkjar)
		$(use_enable cdr)
		$(use_enable lcms)
		$(use_enable nls)
		$(use_enable dbus dbusapi)
		$(use_enable visio)
		$(use_with spell aspell)
		$(use_with spell gtkspell)"

	# aliasing unsafe wrt #310393
	append-flags -fno-strict-aliasing
	gnome2_src_configure
}

src_compile() {
	emake AR="$(tc-getAR)"
}

src_install() {
	gnome2_src_install
	python_optimize "${ED}"/usr/share/${PN}/extensions
}
