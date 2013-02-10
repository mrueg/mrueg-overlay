# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7)

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Control Onkyo receivers over ethernet"
HOMEPAGE="https://github.com/miracle2k/onkyo-eiscp"
COMMIT="410f9f23c35c3987a54a95c1e01f425b86e4183c"
SRC_URI="https://github.com/miracle2k/${PN}/tarball/${COMMIT} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="=dev-python/docopt-0.4.1[${PYTHON_USEDEP}]"
