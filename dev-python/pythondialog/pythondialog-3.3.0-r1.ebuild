# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy3 )

inherit distutils-r1

DESCRIPTION="A Python module for making simple text/console-mode user interfaces"
HOMEPAGE="http://pythondialog.sourceforge.net/ https://pypi.python.org/pypi/python2-pythondialog"
SRC_URI="mirror://sourceforge/pythondialog//${PV}/python3-${P}.tar.bz2 mirror://pypi/${PN:0:1}/python2-${PN}/python2-${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~sparc ~x86"
IUSE="doc examples"

RDEPEND="dev-util/dialog"
DEPEND="doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )"

S=${WORKDIR}

src_prepare() {
	preparation() {
		if python_is_python3; then
			cp -r -l "${WORKDIR}/${P}" "${BUILD_DIR}" || die
			pushd "${BUILD_DIR}" > /dev/null
		else
			cp -r -l "${WORKDIR}/python2-${P}" "${BUILD_DIR}" || die
			pushd "${BUILD_DIR}" > /dev/null
		fi
			sed -e "/^    'sphinx.ext.intersphinx',/d" -i doc/conf.py || die
			popd > /dev/null
			distutils-r1_python_prepare
	}
	python_foreach_impl preparation
	distutils-r1_python_prepare_all
}

src_compile() {
	compile () {
		if [[ -z $DOC_BUILT ]]; then
			use doc && emake -C doc html
			export DOC_BUILT=1
		fi
			distutils-r1_python_compile
	}
	python_foreach_impl run_in_build_dir compile
}

src_install() {
	install () {
		if [[ -z $EXAMPLES_INSTALLED ]]; then
			use examples && local EXAMPLES=( examples/. )
			export EXAMPLES_INSTALLED=1
		fi
		if [[ -z $DOCS_INSTALLED ]]; then
			use doc && local HTML_DOCS=( doc/_build/html/. )
			export DOCS_INSTALLED=1
		fi
		distutils-r1_python_install
		distutils-r1_python_install_all
	}
	python_foreach_impl run_in_build_dir install
}

run_in_build_dir() {
	pushd "${BUILD_DIR}" > /dev/null || die
	"$@"
	popd > /dev/null || die
}
