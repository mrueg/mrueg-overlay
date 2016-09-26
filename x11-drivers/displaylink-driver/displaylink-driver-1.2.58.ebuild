# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils systemd udev

DESCRIPTION="DisplayLink USB Graphics Software"
HOMEPAGE="http://www.displaylink.com/downloads/ubuntu"
SRC_URI="http://www.displaylink.com/downloads/file?id=701 -> ${P}.zip"

LICENSE="DisplayLink"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

QA_PREBUILT="/opt/displaylink/DisplayLinkManager"

DEPEND="app-admin/chrpath"
RDEPEND="=x11-drivers/evdi-1.2*
	virtual/libusb:1
	|| ( x11-drivers/xf86-video-modesetting >=x11-base/xorg-server-1.17.0 )
	!systemd? ( sys-power/pm-utils )"

src_unpack() {
	default
	./"${PN}"-"${PV}".run --nox11 --noexec --target "${P}" || die
}

src_install() {
	local DLM
	case "${ARCH}" in
		amd64)	DLM="${S}/x64-ubuntu-1604/DisplayLinkManager" ;;
		x86)	DLM="${S}/x86-ubuntu-1604/DisplayLinkManager" ;;
	esac

	dodir /opt/displaylink
	dodir /var/log/displaylink

	exeinto /opt/displaylink
	chrpath -d "${DLM}" || die
	doexe "${DLM}"

	insinto /opt/displaylink
	doins *.spkg

	udev_dorules "${FILESDIR}/99-displaylink.rules"

	systemd_dounit "${FILESDIR}/dlm.service"
	newinitd "${FILESDIR}/displaylink.initd" dlm

	insinto /opt/displaylink
	insopts -m0755
	doins "${FILESDIR}/udev.sh"
	if use systemd; then
		newins "${FILESDIR}/pm-systemd-displaylink" suspend.sh
		dosym /opt/displaylink/suspend.sh /lib/systemd/system-sleep/displaylink.sh
	else
		newins "${FILESDIR}/pm-displaylink" suspend.sh
		dosym /opt/displaylink/suspend.sh /etc/pm/sleep.d/displaylink.sh
	fi
}

pkg_postinst() {
	einfo "The DisplayLinkManager Init is now called dlm"
	einfo "and is triggered by udev"
	einfo ""
	einfo "You should be able to use xrandr as follows:"
	einfo "xrandr --setprovideroutputsource 1 0"
	einfo "Repeat for more screens, like:"
	einfo "xrandr --setprovideroutputsource 2 0"
	einfo "Then, you can use xrandr or GUI tools like arandr to configure the screens, e.g."
	einfo "xrandr --output DVI-1-0 --auto"
}
