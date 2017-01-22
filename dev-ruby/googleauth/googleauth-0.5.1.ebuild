# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Simple authorization for accessing Google APIs"
HOMEPAGE="https://github.com/google/google-auth-library-ruby https://rubygems.org/gems/googleauth"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/faraday-0.9
	<dev-ruby/faraday-1
	>=dev-ruby/jwt-1.4
	<dev-ruby/jwt-2
	>=dev-ruby/logging-2.0
	<dev-ruby/logging-3
	>=dev-ruby/memoist-0.12
	<dev-ruby/memoist-1
	>=dev-ruby/multi_json-1.11
	<dev-ruby/multi_json-2
	>=dev-ruby/os-0.9
	<dev-ruby/os-1
	>=dev-ruby/signet-0.7
	<dev-ruby/signet-1"

all_ruby_prepare() {
	sed -i -e "/simplecov/d" -e "/coveralls/d" -e "/SimpleCov/,+4d" spec/spec_helper.rb
}
