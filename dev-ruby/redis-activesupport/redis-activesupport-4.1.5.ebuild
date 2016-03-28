# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Redis store for ActiveSupport"
HOMEPAGE="https://rubygems.org/gems/redis-activesupport http://redis-store.org/redis-activesupport"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/activesupport-5
	>=dev-ruby/activesupport-3
	>=dev-ruby/redis-store-1.1.0
	<dev-ruby/redis-store-1.2"

#ruby_add_bdepend ">=dev-ruby/bundler-1.3
#	<dev-ruby/bundler-2
#	>=dev-ruby/connection_pool-1.2.0
#	<dev-ruby/connection_pool-1.3
#	>=dev-ruby/minitest-4.2
#	<dev-ruby/minitest-5
#	>=dev-ruby/mocha-0.14.0
#	<dev-ruby/mocha-0.15
#	>=dev-ruby/rake-10
#	dev-ruby/redis-store-testing"

RESTRICT="test"
