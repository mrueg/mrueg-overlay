# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_REQ_USE='sqlite'
PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2} )
inherit distutils-r1

DESCRIPTION="A standalone music server based on CherryPy and jPlayer"
HOMEPAGE="http://fomori.org/cherrymusic/"
SRC_URI="https://github.com/devsnd/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/cherrypy[$PYTHON_USEDEP]
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[$PYTHON_USEDEP] 
		media-sound/vorbis-tools )"

python_test() {
	nosetests || die
}

pkg_postinst() {
	elog "Install dev-python/stagger for ID3-Tag support."
}
