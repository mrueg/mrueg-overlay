# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Desktop client for Seafile"
HOMEPAGE="https://github.com/haiwen/seafile-client http://www.seafile.com"
SRC_URI="https://github.com/haiwen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt5 shibboleth test"

RDEPEND="dev-libs/jansson
	dev-libs/libevent
	dev-libs/openssl:0
	dev-db/sqlite:3
	>=net-libs/ccnet-5[client]
	net-libs/libsearpc
	>=net-misc/seafile-5[client]
	qt5? ( dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtnetwork:5
		shibboleth? ( dev-qt/qtwebkit:5 )
	)
	!qt5? ( dev-qt/qtcore:4
		dev-qt/qtdbus:4
		dev-qt/qtgui:4
		shibboleth? ( dev-qt/qtwebkit:4 )
	)"
DEPEND="${RDEPEND}
	qt5? ( dev-qt/linguist-tools:5 )
	test? ( qt5? ( dev-qt/qttest:5 )
		!qt5? ( dev-qt/qttest:4 )
	)"

src_configure() {
	local mycmakeargs=( $(usex qt5 '-DUSE_QT5=ON' '-DUSE_QT5=OFF') \
		$(usex shibboleth '-DBUILD_SHIBBOLETH_SUPPORT=ON' '-DBUILD_SHIBBOLETH_SUPPORT=OFF') )
	cmake-utils_src_configure
}
