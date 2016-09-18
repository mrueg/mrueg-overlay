# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem multilib

DESCRIPTION="The fastest JSON parser and object serializer"
HOMEPAGE="https://rubygems.org/gems/oj http://www.ohler.com/oj https://github.com/ohler55/oj"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

each_ruby_configure() {
	${RUBY} -Cext/oj extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/oj
	cp ext/oj/oj$(get_modname) lib/oj || die
}
