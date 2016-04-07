# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1

DESCRIPTION="VCR imitation designed only for python-requests"
HOMEPAGE="https://github.com/sigmavirus24/betamax"
SRC_URI="https://github.com/sigmavirus24/betamax/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}"/${P}-exclude-test-integrations.patch )

python_test() {
	py.test || die
}
