# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils java-pkg-2 java-ant-2

MY_PN="LaTeXDraw"
MY_P=${MY_PN}-${PV}
DESCRIPTION="A graphical drawing editor for latex"
HOMEPAGE="http://latexdraw.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}-src.tar.bz2 "

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMONDEPEND="dev-java/jlibeps:0
	>=dev-java/malai-1.3
	>=dev-java/mockito-1.9.5
	>=dev-lang/scala-2.11
	>=dev-java/pdf-renderer-1.0.5:0"

RDEPEND=">=virtual/jre-1.7
	${COMMONDEPEND}"

DEPEND=">=virtual/jdk-1.7
	${COMMONDEPEND}"

S=${WORKDIR}/${MY_P}

EANT_GENTOO_CLASSPATH="jlibeps,pdf-renderer,malai,mockito,scala"  #,scala-parser-combinators"

java_prepare() {
	epatch -p1 "${FILESDIR}"/${P}-build.xml.patch
	java-ant_rewrite-classpath maven-build.xml
}
src_install() {
	cd out/data || die
	java-pkg_dojar ${MY_PN}.jar
	insinto /usr/share/${PN}
	doins -r templates
	java-pkg_dolauncher ${PN} --main net.sf.${PN}.${MY_PN}
}
