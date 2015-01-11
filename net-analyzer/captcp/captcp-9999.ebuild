# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit git-r3 distutils-r1
EGIT_REPO_URI="https://github.com/mrueg/captcp.git"
DESCRIPTION="A open source program for TCP analysis of PCAP files"
HOMEPAGE="http://research.protocollabs.com/captcp/"
#SRC_URI="https://github.com/hgn/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/dpkt[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
