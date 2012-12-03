# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs vcs-snapshot

DESCRIPTION="Tools for the TI Stellaris Launchpad boards"
HOMEPAGE="https://github.com/utzig/lm4tools"
SRC_URI="https://github.com/utzig/lm4tools/tarball/cc466b1e453aeff6f8b48d3e2951a943f6f94ce8
-> ${P}.tar.gz"
LICENSE="GPL-2 BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	sed -e "s:gcc:$(tc-getCC):" -i lm4flash/Makefile || die
}
src_compile() {
	CC=$(tc-getCC) emake -C lmicdiusb
	emake -C lm4flash
}

src_install() {
	dobin lm4flash/lm4flash
	dobin lmicdiusb/lmicdi
	dodoc README.md lmicdiusb/{README,commands.txt}
}
