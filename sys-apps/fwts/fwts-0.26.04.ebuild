# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils autotools
DESCRIPTION="Firmware Test Suite"
HOMEPAGE="https://wiki.ubuntu.com/Kernel/Reference/fwts"
SRC_URI="http://launchpad.net/ubuntu/+archive/primary/+files/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/json-c
	dev-libs/libpcre
	sys-apps/pciutils
	sys-power/iasl
	sys-power/pmtools
	sys-apps/dmidecode"
DEPEND="${RDEPEND}
	sys-devel/libtool"

S=${WORKDIR}

src_prepare(){
	sed -i -e 's/-Wall -Werror/-Wall/' configure.ac {,src/,src/lib/src/}Makefile.am || die
	sed -i -e 's:/usr/bin/lspci:'$(type -p lspci)':' src/lib/include/fwts_binpaths.h || die
	epatch "${FILESDIR}"/${P}-gcc-4.6.3.patch
	# No Makefile included - upstream wants autoreconf
	eautoreconf
}
