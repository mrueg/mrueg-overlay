# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem multilib

DESCRIPTION="Unicode normalization library"
HOMEPAGE="http://github.com/blackwinter/unicode https://rubygems.org/gems/unicode http://www.yoshidam.net/Ruby.html#unicode"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/unicode extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/unicode
	mkdir lib/unicode || die
	cp ext/unicode/unicode_native$(get_modname) lib/unicode/ || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb test/test.rb || die
}
