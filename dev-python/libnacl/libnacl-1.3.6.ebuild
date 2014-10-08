# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_7,3_3,3_4})

inherit distutils-r1

DESCRIPTION="Python bindings for libsodium/tweetnacl based on ctypes"
HOMEPAGE="https://libnacl.readthedocs.org"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-libs/libsodium"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	${EPYTHON} tests/runtests.py || die
}
