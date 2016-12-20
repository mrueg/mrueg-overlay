# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A Google OAuth2 strategy for OmniAuth 1.x"
HOMEPAGE="https://github.com/zquestz/omniauth-google-oauth2 https://rubygems.org/gems/omniauth-google-oauth2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jwt-1.5.2
	<dev-ruby/jwt-1.6
	>=dev-ruby/multi_json-1.3
	<dev-ruby/multi_json-2
	>=dev-ruby/omniauth-1.1.1
	>=dev-ruby/omniauth-oauth2-1.3.1"

all_ruby_prepare() {
	sed -i -e "/bundler/d" spec/spec_helper.rb || die
}
