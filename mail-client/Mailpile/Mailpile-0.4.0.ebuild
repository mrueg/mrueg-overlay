# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="A modern, fast web-mail client with user-friendly encryption and privacy features"
HOMEPAGE="https://github.com/pagekite/Mailpile"
SRC_URI="https://github.com/pagekite/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( Apache-2.0 AGPL-3 )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="app-crypt/gnupg
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/markupsafe[${PYTHON_USEDEP}]
	dev-python/pgpdump[${PYTHON_USEDEP}]
	dev-python/pydns:2[${PYTHON_USEDEP}]
	>=mail-filter/spambayes-1.1_beta1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
		>=dev-python/selenium-2.40.0[${PYTHON_USEDEP}]
		>=www-client/phantomjs-1.9.7 )
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	nosetests tests || die
}
