# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="A more flexible replacement for libevent's http EAPI"
HOMEPAGE="http://ellzey.github.io/libevhtp/"
SRC_URI="https://github.com/ellzey/libevhtp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ssl"

DEPEND="ssl? ( dev-libs/openssl:0 )
	dev-libs/libevent[ssl?]
	dev-libs/oniguruma"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		$(usex ssl "" -DEVHTP_DISABLE_SSL=ON) )
	cmake-utils_src_configure
}
