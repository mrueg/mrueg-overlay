# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A Ruby Gem to detect under what license a project is distributed"
HOMEPAGE="https://rubygems.org/gems/licensee https://github.com/benbalter/licensee"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test" # 2 tests fail

ruby_add_rdepend ">=dev-ruby/rugged-0.24"

all_ruby_prepare() {
	sed -i -e "/[Cc]overalls/d" spec/spec_helper.rb || die
}

each_ruby_test() {
	${RUBY} -S rspec-3 --require spec_helper spec || die
}
