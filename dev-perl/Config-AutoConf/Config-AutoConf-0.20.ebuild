# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="Config"

inherit perl-module

DESCRIPTION="A module to implement some of AutoConf macros in pure perl"

SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="mirror"

DEPEND="test? (	>=dev-perl/Test-Pod-1.14
	>=dev-perl/Test-Pod-Coverage-1.08 )"
RDEPEND="dev-perl/Capture-Tiny"

SRC_TEST="do"
