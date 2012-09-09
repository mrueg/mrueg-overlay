# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

MY_PN="${PN%-data}"
MY_PV="0.0.${PV#*alpha}"
MY_P="${MY_PN}-${MY_PV}-alpha"

DESCRIPTION="Data files for 0ad"
HOMEPAGE="http://wildfiregames.com/0ad/"
SRC_URI="http://releases.wildfiregames.com/${MY_P}-unix-data.tar.xz"

LICENSE="GPL-2 CCPL-Attribution-ShareAlike-3.0 LPPL-1.3c BitstreamVera"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	rm binaries/data/tools/fontbuilder/fonts/*.txt
}

src_install() {
	insinto "${GAMES_DATADIR}"/${MY_PN}
	doins -r binaries/data/*
	prepgamesdirs
}
