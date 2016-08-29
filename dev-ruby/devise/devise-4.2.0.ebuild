# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="README.md CONTRIBUTING.md CODE_OF_CONDUCT.md CHANGELOG.md"
RUBY_FAKEGEM_BINWRAP=""
inherit ruby-fakegem

DESCRIPTION="Flexible authentication solution for Rails with Warden"
HOMEPAGE="https://rubygems.org/gems/devise https://github.com/plataformatec/devise"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-3.0
	<dev-ruby/bcrypt-ruby-4
	>=dev-ruby/orm_adapter-0.1
	<dev-ruby/orm_adapter-1
	<dev-ruby/railties-5.1
	>=dev-ruby/railties-4.1.1
	dev-ruby/responders
	>=dev-ruby/warden-1.2.3
	<dev-ruby/warden-1.3
	>=dev-ruby/rails-4
	dev-ruby/omniauth
	dev-ruby/omniauth-oauth2"

ruby_add_bdepend "test? ( dev-ruby/omniauth-facebook
	dev-ruby/omniauth-openid
	>=dev-ruby/mocha-1.1:1.0
	dev-ruby/test_after_commit )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
	sed -i -e "/BUNDLE_GEMFILE/d" -e "/[Bb]undler/d" test/rails_app/config/boot.rb test/rails_app/config/application.rb || die
}
