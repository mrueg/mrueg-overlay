# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/coreos/ioprogress/..."
EGIT_COMMIT="4637e494fd9b23c5565ee193e89f91fdc1639bc0"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Progress bars around io.Reader/Writers"
HOMEPAGE="https://github.com/coreos/ioprogress"
SRC_URI="${ARCHIVE_URI}"
LICENSE="MIT"
SLOT="0/${PVR}"
IUSE=""

DEPEND="dev-go/go-crypto"
