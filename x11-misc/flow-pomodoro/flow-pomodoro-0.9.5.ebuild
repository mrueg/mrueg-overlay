# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils

DESCRIPTION="A pomodoro app that blocks distractions while you work"
HOMEPAGE="https://github.com/iamsergio/flow-pomodoro"
SRC_URI="https://github.com/iamsergio/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-qt/qtdeclarative:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtquickcontrols:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5"
RDEPEND="${DEPEND}"

src_prepare() {
	# Pidgin plugin needs a patched pidgin, others not tested
	sed -i -e 's/plugins//' flow.pro || die
}

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}/usr/" install
}
