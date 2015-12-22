# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1

DESCRIPTION="Thin-wrapper around the mock package for easier use with py.test"
HOMEPAGE="https://github.com/pytest-dev/pytest-mock"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]"
DEPEND="app-arch/unzip
	test? ( ${RDEPEND} )"
