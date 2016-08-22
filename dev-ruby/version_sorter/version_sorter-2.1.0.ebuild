# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem multilib

DESCRIPTION="A C extension that does fast sorting of large sets of version strings"
HOMEPAGE="https://github.com/defunkt/version_sorter https://rubygems.org/gems/version_sorter"
SRC_URI="https://github.com/github/version_sorter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
		${RUBY} -Cext/${PN} extconf.rb || die
}

each_ruby_compile() {
		emake V=1 -Cext/${PN}
		mkdir lib || die
		cp ext/${PN}/${PN}$(get_modname) lib/ || die
}

each_ruby_test() {
	${RUBY} -Ilib test/version_sorter_test.rb || die
}
