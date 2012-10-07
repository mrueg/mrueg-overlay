# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools-utils

DESCRIPTION="GPG/OpenPGP Plugin for Pidgin (XEP-0027)"
HOMEPAGE="https://github.com/segler-alex/Pidgin-GPG"
SRC_URI="mirror://github/segler-alex/Pidgin-GPG/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-crypt/gnupg
	app-crypt/gpgme
	net-im/pidgin"
RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}
