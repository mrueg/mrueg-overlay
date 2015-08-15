# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 autotools-utils
EGIT_REPO_URI="https://github.com/simonccarter/sta.git"

DESCRIPTION="Fast(er) statistics from the command line."
HOMEPAGE="https://github.com/simonccarter/sta"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
