# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod
KEYWORDS=""

DESCRIPTION="Kernel modules for Mali driver"
SRC_URI="http://malideveloper.arm.com/downloads/drivers/DX910/r4p0-00rel1/DX910-SW-99002-r4p0-00rel1.tgz"
HOMEPAGE="http://malideveloper.arm.com/develop-for-mali/drivers/open-source-mali-gpus-linux-kernel-device-drivers/"

LICENSE="all-rights-reserved"
SLOT="0"
IUSE=""

S=${WORKDIR}
RELEASE_VER=r4p0-00rel1

MODULE_NAMES="mali_drm(:${S}/DX910-SW-99002-${RELEASE_VER}/driver/src/egl/x11/drm_module/mali_drm) ump(:${S}/DX910-SW-99002-${RELEASE_VER}/driver/src/devicedrv/ump) mali(:${S}/DX910-SW-99002-${RELEASE_VER}/driver/src/devicedrv/mali)"
BUILD_TARGETS="all"

src_compile(){
	BUILD_PARAMS="EXTRA_CFLAGS=\"-D__linux__ -DMALI_VOLTAGE_LOCK=0 -DMALI_POWER_MGMT_TEST_SUITE=0\" MALI_SHARED_INTERRUPTS=1 MALI_PLATFORM=rk30 TARGET_PLATFORM=rk30 USING_UMP=1 CONFIG=rk30-m400-4 BUILD=release KDIR=${KV_OUT_DIR} M=${S}"
	linux-mod_src_compile
}
