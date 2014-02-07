# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils

if [ "${PV}" = "9999" ]; then
	inherit git-2
	EGIT_REPO_URI="git://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller.git"
	KEYWORDS=""
else
	COMMIT_ID="a55f6ddcc9f48bb0a4300c714b433e5fe523d868"
	SRC_URI="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller/archive/${COMMIT_ID}.tar.gz -> ${P}-git.tar.gz"
	KEYWORDS="~amd64"
	S=${WORKDIR}/Asus-Zenbook-Ambient-Light-Sensor-Controller-${COMMIT_ID}
fi

DESCRIPTION="ASUS Zenbook Ambient Light Sensor Controller"
HOMEPAGE="http://github.com/victorenator/als"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-qt/qtcore"
RDEPEND="app-laptop/zenbook-als-module
	sys-power/acpi_call"

src_configure() {
	eqmake4 service/als-controller.pro
}

src_install() {
	dodoc README.md
	dosbin als-controller
}
