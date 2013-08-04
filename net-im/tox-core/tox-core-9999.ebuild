# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/irungentoo/ProjectTox-Core"

inherit git-2 cmake-utils

DESCRIPTION="Free as in freedom Skype replacement"
HOMEPAGE="http://tox.im"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="dev-libs/libconfig
	net-libs/libsodium"
RDEPEND="${DEPEND}"