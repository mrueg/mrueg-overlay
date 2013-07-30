# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Control Onkyo receivers over ethernet"
HOMEPAGE="https://github.com/miracle2k/onkyo-eiscp"
COMMIT="96b23b321c4f53c93e476f092e9850f9f185770d"
SRC_URI="https://github.com/miracle2k/${PN}/tarball/${COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/docopt[${PYTHON_USEDEP}]"
