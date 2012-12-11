# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN=SparkleShare
DESCRIPTION="Collaboration and sharing tool using git"
HOMEPAGE="http://sparkleshare.org/"
SRC_URI="mirror://github/hbons/${MY_PN}/${PN}-linux-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="appindicator"

CDEPEND="dev-dotnet/gtk-sharp
	dev-dotnet/notify-sharp
	dev-dotnet/webkit-sharp
	dev-lang/mono
	appindicator? ( dev-libs/libappindicator )"
RDEPEND="${CDEPEND}
	>=dev-vcs/git-1.7.12
	net-misc/curl"
DPEND="${CDEPEND}
	virtual/pkgconfig"

src_configure(){
	econf \
		--enable-appindicator=$(usex appindicator yes no)
}

src_install(){
	default
	dodoc -r README.md News.txt legal/
}
