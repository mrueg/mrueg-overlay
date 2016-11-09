# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
GNOME_ORG_MODULE="NetworkManager-${PN##*-}"

inherit autotools gnome2 user

DESCRIPTION="NetworkManager OpenConnect plugin"
HOMEPAGE="https://wiki.gnome.org/Projects/NetworkManager"
COMMIT_ID="b51a1e2fc504af7a98cea514ecedb974c17726be"
SRC_URI="https://git.gnome.org/browse/network-manager-openconnect/snapshot/network-manager-openconnect-${COMMIT_ID}.tar.xz -> ${P}.tar.xz"

S=${WORKDIR}/network-manager-openconnect-${COMMIT_ID}

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="gtk"

RDEPEND="
	>=net-misc/networkmanager-1.1:=
	>=dev-libs/glib-2.32:2
	>=dev-libs/dbus-glib-0.74
	dev-libs/libxml2:2
	>=net-misc/openconnect-3.02:=
	gtk? (
		app-crypt/libsecret
		>=x11-libs/gtk+-3.4:3 )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/intltool
	virtual/pkgconfig
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	gnome2_src_configure \
		--disable-more-warnings \
		--disable-static \
		$(use_with gtk gnome) \
		$(use_with gtk authdlg)
}

pkg_postinst() {
	gnome2_pkg_postinst
	enewgroup nm-openconnect
	enewuser nm-openconnect -1 -1 -1 nm-openconnect
}
