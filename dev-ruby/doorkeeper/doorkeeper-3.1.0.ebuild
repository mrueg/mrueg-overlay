# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRAINSTALL="app config vendor"
RUBY_FAKEGEM_EXTRADOC="CONTRIBUTING.md NEWS.md README.md RELEASING.md"

inherit ruby-fakegem

DESCRIPTION="An OAuth 2 provider for Rails and Grape"
HOMEPAGE="https://rubygems.org/gems/doorkeeper https://github.com/doorkeeper-gem/doorkeeper"

LICENSE="MIT"
SLOT="3"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/railties-3.2"
#ruby_add_bdepend "test? ( >=dev-ruby/capybara-2.3.0:2
#	>=dev-ruby/database_cleaner-1.3.0
#	<dev-ruby/database_cleaner-1.4
#	>=dev-ruby/factory_girl-4.5.0
#	<dev-ruby/factory_girl-4.6
#	>=dev-ruby/generator_spec-0.9.0
#	<dev-ruby/generator_spec-0.10
#	>=dev-ruby/rspec-rails-3.4.0:3
#	>=dev-ruby/timecop-0.7.0
#	<dev-ruby/timecop-0.8 )"
