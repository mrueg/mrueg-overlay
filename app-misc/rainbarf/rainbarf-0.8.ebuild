# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR="SYP"
MY_P=App-${P}
inherit perl-module

DESCRIPTION="CPU/RAM/battery stats chart bar for tmux (and GNU screen)"
HOMEPAGE="https://github.com/creaktive/rainbarf"

LICENSE="Artistic GPL-1+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-perl/Module-Build"
RDEPEND="virtual/perl-Getopt-Long
	virtual/perl-Term-ANSIColor
	virtual/perl-Storable"

S=${WORKDIR}/${MY_P}
