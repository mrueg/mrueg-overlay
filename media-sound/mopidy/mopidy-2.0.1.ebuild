# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit user eutils systemd distutils-r1

DESCRIPTION="An extensible music server that plays music from local disk and more"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy"
SRC_URI="mirror://pypi/M/Mopidy/Mopidy-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/pykka[${PYTHON_USEDEP}]
	>=dev-python/gst-python-1.2.3:1.0[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=media-plugins/gst-plugins-meta-1.0-r2:1.0[http,mp3]
	www-servers/tornado[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/responses[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/Mopidy-${PV}

pkg_setup() {
	enewgroup mopidy
	enewuser mopidy -1 -1 "/etc/mopidy" mopidy
	distutils-r1_pkg_setup
}

src_install() {
	distutils-r1_src_install

	dobin extra/mopidyctl/mopidyctl
	doman extra/mopidyctl/mopidyctl.8

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	systemd_dounit extra/systemd/mopidy.service
	domenu extra/desktop/mopidy.desktop || die

	einfo
	elog "Don't forget to add the mopidy user to the audio group"
	elog "usermod -a -G audio mopidy"
	einfo
}

python_test() {
	py.test || die
}
