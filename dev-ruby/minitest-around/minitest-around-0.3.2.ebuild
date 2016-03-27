# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Alternative for setup/teardown dance"
HOMEPAGE="https://github.com/splattael/minitest-around"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/minitest:5"

all_ruby_prepare() {
	sed -i -e '/bump/ s:^:#:' -e '/ls-files/d' minitest-around.gemspec Rakefile || die
	sed -i -e "/bundler/d" Rakefile test/helper.rb || die
	sed -i -e "s/\"bundle\", \"exec\", //" -e "/cucumber/d" -e "/Cucumber/,+15d" Rakefile || die
	sed -i -e "/spawn_test(code)/,+10d" -e "/describe \"fail\"/,+13d" test/around_spec.rb || die
}
