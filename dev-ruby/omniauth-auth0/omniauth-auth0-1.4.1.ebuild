# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Omniauth-auth0 is the omniauth strategy for Auth0"
HOMEPAGE="https://github.com/auth0/omniauth-auth0 https://rubygems.org/gems/omniauth-auth0"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-oauth2-1.1
	<dev-ruby/omniauth-oauth2-2"
ruby_add_bdepend "test? ( >=dev-ruby/rack-test-0.6.3
	<dev-ruby/rack-test-1
	>=dev-ruby/webmock-1.20.4
	<dev-ruby/webmock-2 )"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
}
