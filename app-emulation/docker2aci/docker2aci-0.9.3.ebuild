# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/appc/${PN}/..."
ARCHIVE_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Library and CLI tool to convert Docker images to ACIs"
HOMEPAGE="https://github.com/appc/docker2aci"
SRC_URI="${ARCHIVE_URI}"
LICENSE="Apache-2.0"
SLOT="0/${PVR}"
IUSE=""

DEPEND="app-emulation/appc-spec
	app-emulation/docker-distribution
	dev-go/ioprogress"

src_install() {
	golang-build_src_install
	dobin bin/${PN}
}
