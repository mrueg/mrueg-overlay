# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/docker/distribution/..."
ARCHIVE_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Docker toolset to pack, ship, store, and deliver content"
HOMEPAGE="https://github.com/docker/distribution"
SRC_URI="${ARCHIVE_URI}"
LICENSE="Apache-2.0"
SLOT="0/${PVR}"
IUSE=""

src_install() {
	golang-build_src_install
	dobin bin/*
}
