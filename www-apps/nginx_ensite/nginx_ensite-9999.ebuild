# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

GH_USER="perusio"
GH_BUILD_TYPE="live"

inherit github bash-completion-r1

DESCRIPTION="A script to enable or disable a site in nginx"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

src_install() {
	dobin bin/${PN}
	dobin bin/nginx_dissite
	doman share/man/man8/nginx_*
	dodoc README.md
	dobashcomp bash_completion.d/${PN}
}
