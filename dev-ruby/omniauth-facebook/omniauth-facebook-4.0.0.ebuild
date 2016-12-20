# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Facebook OAuth2 Strategy for OmniAuth"
HOMEPAGE="https://github.com/mkdynamic/omniauth-facebook https://rubygems.org/gems/omniauth-facebook"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-oauth2-1.2
	<dev-ruby/omniauth-oauth2-2
	dev-ruby/rack"
ruby_add_bdepend "dev-ruby/minitest
	dev-ruby/mocha
	dev-ruby/rake"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile test/helper.rb || die
}
