# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRAINSTALL="app config"

inherit ruby-fakegem

DESCRIPTION="OpenID Connect extension for Doorkeeper"
HOMEPAGE="https://rubygems.org/gems/doorkeeper-openid_connect https://github.com/doorkeeper-gem/doorkeeper-openid_connect"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/doorkeeper-4.0
	<dev-ruby/doorkeeper-5
	>=dev-ruby/json-jwt-1.6
	<dev-ruby/json-jwt-2"

#ruby_add_bdepend "test? ( 
#	dev-ruby/factory_girl
#	dev-ruby/rspec-rails:3
#	dev-ruby/sqlite3 )"

RESTRICT="test" # no tests in gem
