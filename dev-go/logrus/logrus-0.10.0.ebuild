# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/Sirupsen/logrus/..."
ARCHIVE_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Structured, pluggable logging for Go"
HOMEPAGE="https://github.com/Sirupsen/logrus"
SRC_URI="${ARCHIVE_URI}"
LICENSE="MIT"
SLOT="0/${PVR}"
IUSE=""

RESTRICT="test"

src_prepare() {
	# Adds additional deps on gobrake
	rm -rf src/github.com/Sirupsen/${PN}/examples
}
