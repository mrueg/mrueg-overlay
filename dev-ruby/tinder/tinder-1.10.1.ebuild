# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A Ruby API for interfacing with Campfire, the 37Signals chat application"
HOMEPAGE="https://rubygems.org/gems/tinder http://github.com/collectiveidea/tinder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0
	<dev-ruby/eventmachine-2
	>=dev-ruby/faraday-0.9.0
	<dev-ruby/faraday-0.10
	>=dev-ruby/faraday_middleware-0.9
	<dev-ruby/faraday_middleware-1
	>=dev-ruby/hashie-1.0
	>=dev-ruby/json-1.8.0
	<dev-ruby/json-1.9
	dev-ruby/mime-types
	>=dev-ruby/multi_json-1.7
	<dev-ruby/multi_json-2
	>=dev-ruby/twitter-stream-0.1
	<dev-ruby/twitter-stream-1"

	ruby_add_bdepend "test? ( dev-ruby/fakeweb )"
