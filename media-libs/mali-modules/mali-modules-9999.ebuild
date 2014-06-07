# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod git-r3
EGIT_REPO_URI="https://github.com/linux-rockchip/mali-modules.git"
EGIT_REPO_BRANCH="r3p2-01re12-olegk0"
KEYWORDS=""

DESCRIPTION="Kernel modules for Mali driver"
HOMEPAGE="http://github.com/linux-rockchip/mali-modules"

LICENSE="all-rights-reserved"
SLOT="0"
IUSE=""

MODULE_NAMES="(misc:${S})"
BUILD_TARGETS="all"

src_compile(){
	BUILD_PARAMS="EXTRA_CFLAGS=\"-D__linux__\" KDIR=${KV_OUT_DIR} M=${S}/DX910-SW-99002-r3p2-01rel2/driver/src/egl/x11/drm_module/mali_drm.rk30/ -C ${S}/DX910-SW-99002-r3p2-01rel2/driver/src/egl/x11/drm_module/mali_drm.rk30"
	linux-mod_src_compile
	BUILD_PARAMS="KDIR=${KV_OUT_DIR} M=${S}/DX910-SW-99002-r3p2-01rel2/driver/src/devicedrv/ump -C ${S}/DX910-SW-99002-r3p2-01rel2/driver/src/devicedrv/ump CONFIG=rk30-m400-4 BUILD=release"
	linux-mod_src_compile
	BUILD_PARAMS="EXTRA_CFLAGS=\"-DMALI_VOLTAGE_LOCK=0 -DMALI_POWER_MGMT_TEST_SUITE=0\" KDIR=${KV_OUT_DIR} M=${S}/DX910-SW-99002-r3p2-01rel2/driver/src/devicedrv/mali -C ${S}/DX910-SW-99002-r3p2-01rel2/driver/src/devicedrv/mali USING_UMP=1 BUILD=release TARGET_PLATFORM=rk30 MALI_PLATFORM=rk30 MALI_SHARED_INTERRUPTS=1"
	linux-mod_src_compile
}

src_install(){
	insinto /lib/modules/${KV_FULL}/
	doins DX910-SW-99002-r3p2-01rel2/driver/src/egl/x11/drm_module/mali_drm.rk30/mali_drm.${KV_OBJ}
	doins DX910-SW-99002-r3p2-01rel2/driver/src/devicedrv/ump/ump.${KV_OBJ}
	doins DX910-SW-99002-r3p2-01rel2/driver/src/devicedrv/mali/mali.${KV_OBJ}
}
