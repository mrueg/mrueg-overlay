# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit vcs-snapshot distutils-r1

DESCRIPTION="A command-line utility that creates projects from cookiecutters (project templates)"
HOMEPAGE="https://github.com/audreyr/cookiecutter"

COMMIT_ID="df76d74c64f0192a65997297f19ad72e124e4e72"
SRC_URI="https://github.com/audreyr/cookiecutter/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="test" # tests currently fail here

RDEPEND="dev-python/binaryornot[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.7[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.10[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/whichcraft[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}] )"

DOCS=( README.rst HISTORY.rst CONTRIBUTING.rst )

python_test() {
	py.test || die
}
