# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit linux-mod

DESCRIPTION="Extensible Virtual Display Interface"
HOMEPAGE="https://github.com/DisplayLink/evdi"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SRC_URI="https://github.com/DisplayLink/evdi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

RDEPEND="x11-libs/libdrm"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers"

MODULE_NAMES="evdi(video:${S}/module)"

CONFIG_CHECK="FB_VIRTUAL ~!INTEL_IOMMU"

pkg_setup() {
	linux-mod_pkg_setup
}

src_compile() {
	linux-mod_src_compile
	emake -C library
}

src_install() {
	linux-mod_src_install
	dolib.so library/libevdi.so
}
