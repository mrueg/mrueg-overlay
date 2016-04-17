# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/golang/lint/..."
EGIT_COMMIT="8f348af5e29faa4262efdc14302797f23774e477"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A linter for Go source code"
HOMEPAGE="https://github.com/golang/lint"
SRC_URI="${ARCHIVE_URI}"
LICENSE="BSD"
SLOT="0/${PVR}"
IUSE=""

DEPEND="dev-go/go-tools"

src_install() {
	golang-build_src_install
	dobin bin/*
}
