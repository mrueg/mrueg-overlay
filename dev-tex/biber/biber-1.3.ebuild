# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils perl-module

MY_PN="biblatex-${PN}"

DESCRIPTION="A BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/"
SRC_URI="mirror://sourceforge/project/${MY_PN}/${MY_PN}/${PV}/${MY_PN}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Artistic-2 GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="${RDEPEND}
	test? ( dev-perl/File-Which )
	virtual/perl-Module-Build"
RDEPEND=">=dev-lang/perl-5.14
	dev-perl/Business-ISBN
	dev-perl/Business-ISSN
	dev-perl/Business-ISMN
	dev-perl/Data-Compare
	dev-perl/Data-Dump
	dev-perl/Date-Simple
	dev-perl/File-Slurp-Unicode
	dev-perl/IPC-Run3
	dev-perl/libwww-perl
	dev-perl/List-AllUtils
	dev-perl/Log-Log4perl
	dev-perl/regexp-common
	dev-perl/Readonly
	dev-perl/Readonly-XS
	>=dev-perl/Text-BibTeX-0.64
	dev-perl/XML-LibXML-Simple
	dev-perl/XML-LibXSLT
	>=dev-tex/biblatex-2.3
	virtual/perl-IPC-Cmd"

S="${WORKDIR}"/${MY_PN}-1.2

SRC_TEST="parallel"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.2-drop-Mozilla-CA.patch														
	perl-module_src_prepare
	}
