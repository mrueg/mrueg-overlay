# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit bash-completion-r1

DESCRIPTION="Manages and shares secrets using GnuPG and Git with custom commands"
HOMEPAGE="https://keyringer.pw"
SRC_URI="https://keyringer.pw/releases/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-crypt/gnupg
	dev-vcs/git"

src_prepare() {
	default
	sed -i -e "s#/lib#/$(get_libdir)#" Makefile || die
	sed -i -e "s#/\.\./lib#/\.\./$(get_libdir)#" keyringer || die
}

src_install() {
	emake install_lib install_bin PREFIX="usr" DESTDIR="${D}"
	doman share/man/keyringer.1
	dodoc README.md ChangeLog
	dobashcomp lib/${PN}/completions/bash/keyringer
	insinto /usr/share/zsh/site-functions
	doins lib/${PN}/completions/zsh/_keyringer
}
