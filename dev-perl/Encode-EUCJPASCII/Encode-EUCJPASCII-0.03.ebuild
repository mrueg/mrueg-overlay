# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MODULE_AUTHOR="NEZUMI"

inherit perl-module

DESCRIPTION="eucJP-ascii - An eucJP-open mapping"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/perl
	virtual/perl-Encode"
DEPEND="${RDEPEND}"
