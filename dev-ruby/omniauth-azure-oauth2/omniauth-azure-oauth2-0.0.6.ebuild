# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="An Windows Azure Active Directory OAuth2 strategy for OmniAuth"
HOMEPAGE="https://github.com/KonaTeam/omniauth-azure-oauth2 https://rubygems.org/gems/omniauth-azure-oauth2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jwt-1.0
	<dev-ruby/jwt-2
	>=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2
	>=dev-ruby/omniauth-oauth2-1.1
	<dev-ruby/omniauth-oauth2-2"

all_ruby_prepare() {
	sed -i -e "/bundler/d" spec/spec_helper.rb || die
}
