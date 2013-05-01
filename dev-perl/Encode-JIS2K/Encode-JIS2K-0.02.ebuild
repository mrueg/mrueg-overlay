# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MODULE_AUTHOR="DANKOGAI"

inherit perl-module

DESCRIPTION="JIS X 0212 (aka JIS 2000) Encodings"

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-lang/perl
	virtual/perl-Encode"
DEPEND="${RDEPEND}"

SRC_TEST="do"
