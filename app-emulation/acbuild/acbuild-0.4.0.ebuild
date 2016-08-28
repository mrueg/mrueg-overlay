# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/appc/${PN}/..."
ARCHIVE_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A build tool for ACIs"
HOMEPAGE="https://github.com/appc/acbuild"
SRC_URI="${ARCHIVE_URI}"
LICENSE="Apache-2.0"
SLOT="0/${PVR}"
IUSE=""

DEPEND=">=app-emulation/appc-spec-0.8.5
	app-emulation/docker-registry
	dev-go/mux"

src_install() {
	golang-build_src_install
	dobin bin/*
}
