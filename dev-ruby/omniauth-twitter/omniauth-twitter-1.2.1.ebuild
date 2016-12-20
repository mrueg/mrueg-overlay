# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="OmniAuth strategy for Twitter"
HOMEPAGE="https://github.com/arunagw/omniauth-twitter https://rubygems.org/gems/omniauth-twitter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.3
	<dev-ruby/json-2
	>=dev-ruby/omniauth-oauth-1.1
	<dev-ruby/omniauth-oauth-2"

ruby_add_bdepend "test? ( dev-ruby/webmock
	dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+3d" spec/spec_helper.rb || die
}
