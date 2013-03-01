# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_REQ_USE='sqlite'
PYTHON_COMPAT=( python2_6 python2_7 python3_1 python3_2 )
inherit distutils-r1

DESCRIPTION="A standalone music server based on CherryPy and jPlayer"
HOMEPAGE="http://fomori.org/cherrymusic/"
SRC_URI="https://github.com/devsnd/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/cherrypy"
RDEPEND="${DEPEND}"

python_test() {
	./runtests || die
}
