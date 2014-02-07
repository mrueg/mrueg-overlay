# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/victorenator/als.git"
	KEYWORDS=""
else
	COMMIT_ID="b453b6103e6b45cfc96516054b58e35e23511c4d"
	SRC_URI="https://github.com/victorenator/als/archive/${COMMIT_ID}.tar.gz -> ${P}-git.tar.gz"
	KEYWORDS="~amd64"
	S=${WORKDIR}/als-${COMMIT_ID}
fi

DESCRIPTION="A kernel module for the ASUS Zenbook Ambient Light Sensor Driver"
HOMEPAGE="http://github.com/victorenator/als"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

MODULE_NAMES="als(misc:${S})"
BUILD_TARGETS="all"

src_prepare(){
	sed -i -e 's/make/$(MAKE)/' Makefile || die
}

src_compile(){
	BUILD_PARAMS="KDIR=${KV_OUT_DIR} M=${S}"
	linux-mod_src_compile
}
