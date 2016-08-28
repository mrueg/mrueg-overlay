# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/gorilla/mux/..."
EGIT_COMMIT="0b13a922203ebdbfd236c818efcd5ed46097d690"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A powerful URL router and dispatcher for golang"
HOMEPAGE="https://github.com/gorilla/mux"
SRC_URI="${ARCHIVE_URI}"
LICENSE="BSD"
SLOT="0/${PVR}"
IUSE=""

DEPEND="dev-go/context"
