# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pygments/pygments-1.5-r1.ebuild,v 1.3 2012/12/17 19:58:40 mgorny Exp $

EAPI=5
PYTHON_COMPAT=( python{2_5,2_6,2_7,3_1,3_2} pypy{1_8,1_9} )

EHG_REPO_URI="https://bitbucket.org/birkenfeld/${PN}-main/"
inherit mercurial distutils-r1

MY_PN="Pygments"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Pygments is a syntax highlighting package written in Python."
HOMEPAGE="http://pygments.org/ http://pypi.python.org/pypi/Pygments"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="doc test"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		virtual/ttf-fonts
		dev-texlive/texlive-latexrecommended
	)"

DOCS=( CHANGES )

python_test() {
	cp -r -l tests "${BUILD_DIR}"/ || die

	if [[ ${EPYTHON} == python3.* ]]; then
		# Notes:
		#   -W is not supported by python3.1
		#   -n causes Python to write into hardlinked files
		2to3 -w "${BUILD_DIR}"/tests/*.py || die
	fi

	nosetests -w "${BUILD_DIR}"/tests || die
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/build/. )

	distutils-r1_python_install_all
}
