# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1

DESCRIPTION=" An authentication handler for using Kerberos with Python Requests"
HOMEPAGE="https://github.com/requests/requests-kerberos"
SRC_URI="https://github.com/requests/requests-kerberos/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pykerberos[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	${PYTHON} test_requests_kerberos.py || die
}
