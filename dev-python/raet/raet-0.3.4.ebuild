# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Reliable Asynchronous Event Transport Protocol"
HOMEPAGE="https://github.com/saltstack/raet"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/libnacl[${PYTHON_USEDEP}]
	dev-python/ioflo[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND} )
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	${EPYTHON} raet/test/test_nacling.py || die
	${EPYTHON} raet/test/test_template.py || die
}
