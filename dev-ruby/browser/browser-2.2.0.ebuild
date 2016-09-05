# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Do some browser detection with Ruby"
HOMEPAGE="https://rubygems.org/gems/browser http://github.com/fnando/browser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/minitest-autotest
	dev-ruby/minitest-utils
	dev-ruby/rack-test
	dev-ruby/rails
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" Rakefile test/test_helper.rb || die
	sed -i -e "/[Cc]ode[Cc]limate/d" test/test_helper.rb || die
}

RESTRICT="test" # tests fail
