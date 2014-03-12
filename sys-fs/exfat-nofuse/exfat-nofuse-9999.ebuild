# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod git-2

DESCRIPTION="Non-fuse kernel driver for exFat and VFat file systems"
HOMEPAGE="https://github.com/dorimanx/exfat-nofuse.git"

EGIT_REPO_URI="git://github.com/dorimanx/exfat-nofuse.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE=""

MODULE_NAMES="exfat(kernel/fs:${S})"
BUILD_TARGETS="-j1 all"

src_prepare(){
	sed -i -e "/^KREL/,2d" Makefile || die
}
src_compile(){
	BUILD_PARAMS="KDIR=${KV_OUT_DIR} M=${S}"
	linux-mod_src_compile
}
