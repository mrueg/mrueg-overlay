# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_7,3_3})

inherit distutils-r1

DESCRIPTION="py.test plugin to capture log messages"
HOMEPAGE=" http://bitbucket.org/memedough/pytest-capturelog/overview"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/py[${PYTHON_USEDEP}]"
