# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

ESVN_REPO_URI="svn://svn.code.sf.net/p/xc3sprog/code/trunk"
inherit subversion cmake-utils

DESCRIPTION="A suite of utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs"
HOMEPAGE="http://xc3sprog.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="-ftd2xx"

DEPEND="!ftd2xx? ( dev-embedded/libftdi )
ftd2xx? ( dev-embedded/libftd2xx )
	virtual/libusb:0"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e '/if(EXISTS/a set(VERSION_STRING "Gentoo")' \
		-e '/if(EXISTS/,/endif(EXISTS/d' CMakeLists.txt || die
	sed -i -e 's#usr/lib#opt/lib64#' FindlibFTD2XX.cmake || die
}
src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use_use ftd2xx)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	insinto /usr/share/${PF}/
	doins -r bscan_spi
}
