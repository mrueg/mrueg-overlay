# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

MODULE_AUTHOR="AMBS"
MODULE_SECTION="Text"

inherit perl-module

DESCRIPTION="A Perl library for reading, parsing, and processing BibTeX files"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=">=virtual/perl-Module-Build-0.36.03
	>=dev-perl/Config-AutoConf-0.16
	>=virtual/perl-ExtUtils-CBuilder-0.27
	>=dev-perl/ExtUtils-LibBuilder-0.02"
RDEPEND="!dev-libs/btparse
	>=dev-perl/Capture-Tiny-0.06"

SRC_TEST="do"
