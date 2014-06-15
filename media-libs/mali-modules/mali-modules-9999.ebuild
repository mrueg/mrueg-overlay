# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod git-r3
EGIT_REPO_URI="https://github.com/linux-rockchip/mali-modules.git"
EGIT_REPO_BRANCH="r3p2-01rel2-olegk0"
KEYWORDS=""

DESCRIPTION="Kernel modules for Mali driver"
HOMEPAGE="http://github.com/linux-rockchip/mali-modules"

LICENSE="all-rights-reserved"
SLOT="0"
IUSE=""

BASE_DIR="DX910-SW-99002-r3p2-01rel2/driver/src"
MODULE_NAMES="mali_drm(:${S}/${BASE_DIR}/egl/x11/drm_module/mali_drm.rk30) ump(:${S}/${BASE_DIR}/devicedrv/ump) mali(:${S}/${BASE_DIR}/devicedrv/mali)"
BUILD_TARGETS="all"

src_compile(){
	BUILD_PARAMS="EXTRA_CFLAGS=\"-D__linux__ -DMALI_VOLTAGE_LOCK=0 -DMALI_POWER_MGMT_TEST_SUITE=0\" MALI_SHARED_INTERRUPTS=1 MALI_PLATFORM=rk30 TARGET_PLATFORM=rk30 USING_UMP=1 CONFIG=rk30-m400-4 BUILD=release KDIR=${KV_OUT_DIR} M=${S}"
	linux-mod_src_compile
}
