# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1

DESCRIPTION="py.test plugin for distributed testing and loop-on-failing modes"
HOMEPAGE="https://bitbucket.org/pytest-dev/pytest-xdist"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-python/execnet-1.1[${PYTHON_USEDEP}]
	dev-python/py[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools_scm[${PYTHON_USEDEP}]
	test? ( ${RDEPEND} )"

RESTRICT="test"

src_prepare() {
	rm -r testing/__pycache__ testing/*.pyc || die
	distutils-r1_src_prepare
}
python_test() {
	py.test testing || die
}
