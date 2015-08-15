# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 toolchain-funcs
EGIT_REPO_URI="https://github.com/neo-technologies/rockchip-mkbootimg.git"

DESCRIPTION="Tools for unpacking and repacking boot.img"
HOMEPAGE="https://github.com/neo-technologies/rockchip-mkbootimg"

LICENSE="Apache-2.0 BSD all-rights-reserved"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/openssl:0"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's/LDFLAGS ?=/LDFLAGS = ${USER_LDFLAGS} /' Makefile || die
}
src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS}" USER_LDFLAGS="${LDFLAGS}"
}
src_install() {
	# File collision with vanilla Android tools
	newbin mkbootimg mkbootimg-rockchip
	newbin afptool afptool-rockchip
	newbin unmkbootimg unmkbootimg-rockchip
	newbin mkrootfs mkrootfs-rockchip
	newbin mkcpiogz mkcpiogz-rockchip
	newbin unmkcpiogz unmkcpiogz-rockchip
	newbin img_maker img_maker-rockchip
}
