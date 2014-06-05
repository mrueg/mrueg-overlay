# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

ETYPE=sources
K_DEFCONFIG="rk3188_radxa_rock_defconfig"
K_SECURITY_UNSUPPORTED=1
EXTRAVERSION="-${PN}/-*"
inherit kernel-2
detect_version
detect_arch

EGIT_REPO_URI="https://github.com/linux-rockchip/rockchip-3.0.git"
EGIT_BRANCH="radxa-rock/linux"
inherit git-r3

DESCRIPTION="Kernel sources for Radxa Rock"
HOMEPAGE="https://github.com/linux-rockchip/ https://radxa.com"

KEYWORDS=""

src_unpack() {
	git-r3_src_unpack
	mv ${P} linux-3.0.36-radxa || die
	unpack_set_extraversion
}
