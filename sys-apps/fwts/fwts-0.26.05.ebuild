# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils autotools
DESCRIPTION="Firmware Test Suite"
HOMEPAGE="https://wiki.ubuntu.com/Kernel/Reference/fwts"
SRC_URI="http://launchpad.net/ubuntu/+archive/primary/+files/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/json-c
	dev-libs/libpcre
	sys-apps/pciutils
	sys-power/iasl
	sys-power/pmtools
	sys-apps/dmidecode
	sys-apps/microcode-data"
DEPEND="${RDEPEND}
	sys-devel/libtool"

S=${WORKDIR}

src_prepare(){
	sed -i -e 's/-Wall -Werror/-Wall/' configure.ac {,src/,src/lib/src/}Makefile.am || die
	sed -i -e 's:/usr/bin/lspci:'$(type -p lspci)':' src/lib/include/fwts_binpaths.h || die
	sed -i -e 's|/usr/share/misc/intel-microcode.dat|/lib/firmware/microcode.dat|' src/lib/include/fwts_microcode.h || die
	
	# Fix json-c includes
	if has_version '>=dev-libs/json-c-0.10-r1'; then
		sed -e 's/^#include <json\//#include <json-c\//g' -i \
			configure.ac \
			src/acpi/syntaxcheck/syntaxcheck.c \
			src/lib/include/fwts_json.h \
			src/lib/src/fwts_klog.c \
			src/lib/src/fwts_log_json.c \
			src/utilities/kernelscan.c || die
	fi

	# No Makefile included - upstream wants autoreconf
	eautoreconf
}
