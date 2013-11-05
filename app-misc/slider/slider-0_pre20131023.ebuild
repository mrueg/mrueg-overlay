# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot toolchain-funcs

COMMIT_ID="20ead194c2d0fe76e6c811d8ff1c195925cd4dec"
DESCRIPTION="PDF presentation tool"
HOMEPAGE="https://github.com/TrilbyWhite/Slider"
SRC_URI="https://github.com/TrilbyWhite/Slider/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-text/poppler:=
	x11-libs/cairo
	x11-libs/libXrandr"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
