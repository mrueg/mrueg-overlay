# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 toolchain-funcs
EGIT_REPO_URI="https://github.com/AndroidRoot/BootTools.git"

DESCRIPTION="Tools for unpacking and repacking boot.img"
HOMEPAGE="https://github.com/AndroidRoot/BootTools"

LICENSE="Apache-2.0 BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

src_prepare() {
	sed -i -e 's/CFLAGS=/CFLAGS=${USER_CFLAGS} /' Makefile || die
}
src_compile() {
	emake CC="$(tc-getCC)" USER_CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}
src_install() {
	emake install PREFIX=usr DESTDIR="${D}"
}
