# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Client for accessing Google APIs"
HOMEPAGE="https://github.com/google/google-api-ruby-client https://rubygems.org/gems/google-api-client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test" # missing fixtures in gemfile

ruby_add_rdepend ">=dev-ruby/activesupport-3.2
	<dev-ruby/activesupport-5.0
	>=dev-ruby/addressable-2.3
	<dev-ruby/addressable-3
	>=dev-ruby/autoparse-0.3
	<dev-ruby/autoparse-1
	>=dev-ruby/extlib-0.9
	<dev-ruby/extlib-1
	>=dev-ruby/faraday-0.9
	<dev-ruby/faraday-1
	>=dev-ruby/googleauth-0.3
	<dev-ruby/googleauth-1
	>=dev-ruby/launchy-2.4
	<dev-ruby/launchy-3
	>=dev-ruby/multi_json-1.10
	<dev-ruby/multi_json-2
	>=dev-ruby/retriable-1.4
	<dev-ruby/retriable-2
	>=dev-ruby/signet-0.6
	<dev-ruby/signet-1"
