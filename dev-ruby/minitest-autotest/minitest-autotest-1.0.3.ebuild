# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Continually and intelligently test only those files you change with autotest"
HOMEPAGE="https://github.com/seattlerb/minitest-autotest https://rubygems.org/gems/minitest-autotest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-server-1.0
	<dev-ruby/minitest-server-2"

each_ruby_test() {
	${RUBY} -Ilib test/test_minitest/test_autorun.rb || die
	${RUBY} -Ilib test/test_minitest/test_good.rb || die
}
