# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Microsoft Azure Client Library for Ruby"
HOMEPAGE="http://github.com/azure/azure-sdk-for-ruby https://rubygems.org/gems/azure https://github.com/azure/azure-sdk-for-ruby"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3
	<dev-ruby/addressable-3
	>=dev-ruby/azure-core-0.1
	<dev-ruby/azure-core-1
	>=dev-ruby/faraday-0.9
	<dev-ruby/faraday-1
	>=dev-ruby/faraday_middleware-0.10
	<dev-ruby/faraday_middleware-1
	>=dev-ruby/json-1.8
	<dev-ruby/json-2
	<dev-ruby/mime-types-3.0
	>=dev-ruby/mime-types-1
	>=dev-ruby/nokogiri-1.6
	<dev-ruby/nokogiri-2
	>=dev-ruby/systemu-2.6
	<dev-ruby/systemu-3
	>=dev-ruby/thor-0.19
	<dev-ruby/thor-1"
