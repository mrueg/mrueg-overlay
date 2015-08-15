# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit qmake-utils git-r3
EGIT_REPO_URI="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller.git"
KEYWORDS=""

DESCRIPTION="ASUS Zenbook Ambient Light Sensor Controller"
HOMEPAGE="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-libs/libbsd"
RDEPEND="${DEPEND}
	app-laptop/zenbook-als-module"

src_configure() {
	eqmake4 service/als-controller.pro
}

src_install() {
	newinitd "${FILESDIR}"/${PN}.initd als-controller
	dodoc README.md
	dosbin als-controller
}
