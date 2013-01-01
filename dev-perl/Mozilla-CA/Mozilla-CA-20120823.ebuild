# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MODULE_AUTHOR="ABH"

inherit perl-module

DESCRIPTION="Mozilla's CA cert bundle in PEM format"

LICENSE="|| ( GPL-2 GPL-3 LGPL-2.1 LGPL-3 MPL-1.1 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker"

SRC_TEST="do"
