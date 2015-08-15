# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GH_USER="perusio"
GH_TAG="9d13b0ff5626b093c7c3cd2e0aa088f8f06b7b35"

inherit github bash-completion-r1

DESCRIPTION="A script to enable or disable a site in nginx"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_install() {
	dobin ${PN}
	dobin nginx_dissite
	doman man/${PN}.8
	dodoc README.md
	dobashcomp bash_completion.d/${PN}
}
