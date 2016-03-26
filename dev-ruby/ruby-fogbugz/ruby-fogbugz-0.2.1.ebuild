# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A simple Ruby wrapper for the Fogbugz XML API"
HOMEPAGE="https://github.com/firmafon/ruby-fogbugz https://rubygems.org/gems/ruby-fogbugz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/crack-0.4
	<dev-ruby/crack-1"
ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.8
	<dev-ruby/minitest-6
	>=dev-ruby/mocha-1.1
	<dev-ruby/mocha-2
	>=dev-ruby/rake-10.1 )"

all_ruby_prepare() {
	sed -i -e "/[Cc]ode[Cc]limate/d" test/test_helper.rb || die
}
