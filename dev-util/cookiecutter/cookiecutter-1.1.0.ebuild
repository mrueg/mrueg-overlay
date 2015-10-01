# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit vcs-snapshot distutils-r1

DESCRIPTION="A command-line utility that creates projects from cookiecutters (project templates)"
HOMEPAGE="https://github.com/audreyr/cookiecutter"

SRC_URI="https://github.com/audreyr/cookiecutter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

#RESTRICT="test" # tests currently fail here

RDEPEND=">=dev-python/binaryornot-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/future-0.15.2[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	>=dev-python/click-4.0[${PYTHON_USEDEP}]
	>=dev-python/whichcraft-0.1.1[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-mock[${PYTHON_USEDEP}] )"

DOCS=( README.rst HISTORY.rst CONTRIBUTING.rst )

python_test() {
	py.test || die
}
