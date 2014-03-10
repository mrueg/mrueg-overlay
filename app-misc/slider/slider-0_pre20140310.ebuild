# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot toolchain-funcs

COMMIT_ID="c934ca8f6fed7030e9d70ce077137d372689d236"
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
