# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOC_DIR="doc"

inherit ruby-fakegem multilib

DESCRIPTION="Additional IO singleton and instance methods"
HOMEPAGE="https://rubygems.org/gems/io-extra http://www.rubyforge.org/projects/shards https://github.com/djberg96/io-extra"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "dev-ruby/test-unit:2"

RESTRICT="test"

each_ruby_prepare() {
	sed -i -e "/omit/d" test/test_io_extra.rb || die
}

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext
	mkdir -p lib/io || die
	cp ext/extra$(get_modname) lib/io/ || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb test/test_io_extra.rb || die
}
