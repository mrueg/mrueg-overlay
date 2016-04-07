# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Python JIRA Library is the easiest way to automate JIRA"
HOMEPAGE="https://github.com/pycontribs/jira"
COMMIT_ID="0ad3c352839060da9dc146df635a97119eccd114"
SRC_URI="https://github.com/pycontribs/jira/archive/${COMMIT_ID}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND=">=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	>=dev-python/requests-2.6.0[${PYTHON_USEDEP}]
	dev-python/requests-kerberos[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-0.3.3[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/tlslite-0.4.4[${PYTHON_USEDEP}]' python_2_7 )"

DEPEND="test? ( ${RDEPEND}
	dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

RESTRICT="test"

python_test() {
	py.test || die
}
