# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# radicale also supports python3
# but python-ldap is blocking here
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="ssl?"

inherit distutils-r1 user

MY_PN="Radicale"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A simple CalDAV calendar server"
HOMEPAGE="http://www.radicale.org/"
SRC_URI="https://github.com/Kozea/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fastcgi git http_auth ldap mysql sqlite pam postgres ssl test"

RESTRICT="test" # fail here

RDEPEND="
	fastcgi? ( $(python_gen_cond_dep 'dev-python/flup[${PYTHON_USEDEP}]' python2_7)
		$(python_gen_cond_dep 'dev-python/flipflop[${PYTHON_USEDEP}]' python3_4) )
	git? ( dev-python/dulwich[${PYTHON_USEDEP}] )
	http_auth? ( dev-python/requests[${PYTHON_USEDEP}] )
	ldap? ( dev-python/python-ldap[${PYTHON_USEDEP}] )
	mysql? ( dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/mysql-python[${PYTHON_USEDEP}] )
	sqlite? ( dev-python/sqlalchemy[${PYTHON_USEDEP},sqlite] )
	pam? ( dev-python/pypam[${PYTHON_USEDEP}] )
	postgres? ( dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/psycopg:2[${PYTHON_USEDEP}] )"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/nose[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/dulwich[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}] )"

S=${WORKDIR}/${MY_P}

RDIR=/var/lib/radicale
LDIR=/var/log/radicale

PATCHES=( "${FILESDIR}"/${PN}-0.10-config.patch )

DOCS=( NEWS.rst TODO.rst )

pkg_setup() {
	enewgroup radicale
	enewuser radicale -1 -1 ${RDIR} radicale
}

python_install_all() {
	# delete the useless .rst, so that it is not installed
	rm README.rst || die

	# init file
	newinitd "${FILESDIR}"/radicale.init.d radicale

	# directories
	diropts -m0750
	dodir ${RDIR} ${LDIR}
	fowners radicale:radicale ${RDIR} ${LDIR}

	# config file
	insinto /etc/${PN}
	doins config logging rights

	# fcgi and wsgi files
	python_doscript radicale.wsgi
	use fastcgi &&  python_doscript radicale.fcgi

	distutils-r1_python_install_all
}

python_test() {
	nosetests tests || die
}

pkg_postinst() {
	einfo "Radicale now supports WSGI."
	einfo "A sample wsgi-script has been put into ${ROOT}usr/share/${PN}."
	use fastcgi && einfo "You will also find there an example fcgi-script."
}
