# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)

EGIT_REPO_URI="https://github.com/letsencrypt/letsencrypt.git"

inherit git-r3 distutils-r1

DESCRIPTION="Nginx plugin for letsencrypt"
HOMEPAGE="https://github.com/letsencrypt/letsencrypt https://letsencrypt.org/"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

RDEPEND="app-crypt/letsencrypt[${PYTHON_USEDEP}]
	dev-python/acme[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${P}/${PN}

python_test() {
	nosetests -w ${PN/-/_}/tests || die
}
