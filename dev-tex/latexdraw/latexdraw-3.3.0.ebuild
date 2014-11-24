# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils java-pkg-2 java-ant-2 versionator

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
	>=dev-java/scala-2.11
	>=dev-java/pdf-renderer-1.0.5:0"

RDEPEND=">=virtual/jre-1.6
	${COMMONDEPEND}"

DEPEND=">=virtual/jdk-1.6
	app-arch/unzip
	${COMMONDEPEND}"

S=${WORKDIR}/${MY_P}

EANT_GENTOO_CLASSPATH="jlibeps,pdf-renderer,malai,scala"
JAVA_ANT_REWRITE_CLASSPATH="true"

java_prepare() {
	epatch -p1 "${FILESDIR}"/${PN}-3.2.0-build.xml.patch
	java-ant_rewrite-classpath build.xml
}
src_install() {
	cd out/data || die
	java-pkg_dojar ${MY_PN}.jar
	insinto /usr/share/${PN}
	doins -r templates
	java-pkg_dolauncher ${PN} --main net.sf.${PN}.${MY_PN}
}
