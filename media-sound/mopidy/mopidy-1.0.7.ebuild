# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="An extensible music server that plays music from local disk and more"
HOMEPAGE="http://mopidy.com https://github.com/mopidy/mopidy"
SRC_URI="mirror://pypi/M/Mopidy/Mopidy-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/pykka[${PYTHON_USEDEP}]
	dev-python/gst-python:0.10[${PYTHON_USEDEP}]
	media-libs/gst-plugins-bad:0.10
	media-libs/gst-plugins-good:0.10
	media-libs/gst-plugins-ugly:0.10
	media-plugins/gst-plugins-meta:0.10
	www-servers/tornado[${PYTHON_USEDEP}]"

DEPEND="test? ( ${RDEPEND}
	dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/Mopidy-${PV}

DOCS=( README.rst )

python_test() {
	nosetests || die
}
