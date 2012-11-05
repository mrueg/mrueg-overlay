# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="ExtUtils"

inherit perl-module

DESCRIPTION="A module to implement some of AutoConf macros in pure perl"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

DEPEND="virtual/perl-Module-Build
	test? ( >=dev-perl/Test-Pod-1.22
		>=dev-perl/Test-Pod-Coverage-1.08 )"
RDEPEND=""

SRC_TEST="do"
