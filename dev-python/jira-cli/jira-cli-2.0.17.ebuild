# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1

DESCRIPTION="Simple command line utility to interact with your jira instance"
HOMEPAGE="https://github.com/alisaifee/jira-cli"
SRC_URI="https://github.com/alisaifee/jira-cli/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/jira[${PYTHON_USEDEP}]
	dev-python/suds[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
		>=dev-python/vcrpy-1.7.4[${PYTHON_USEDEP}] )"

RESTRICT="test"

src_prepare() {
	sed -i -e "/sys.version < (2,7)/,+2d" setup.py || die
	sed -i -e "s/'ez_setup'/'ez_setup','tests'/" setup.py || die
	distutils-r1_src_prepare
}

python_test() {
	nosetests || die
}
