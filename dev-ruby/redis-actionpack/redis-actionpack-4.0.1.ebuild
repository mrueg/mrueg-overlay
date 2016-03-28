# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRA_DOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Redis session store for ActionPack"
HOMEPAGE="https://rubygems.org/gems/redis-actionpack http://redis-store.org/redis-actionpack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-4
	>=dev-ruby/redis-rack-1.5.0
	<dev-ruby/redis-rack-1.6
	>=dev-ruby/redis-store-1.1.0
	<dev-ruby/redis-store-1.2"

#ruby_add_bdepend "test? ( dev-ruby/mini_backtrace
#	dev-ruby/mini_specunit
#	>=dev-ruby/minitest-4.2
#	<dev-ruby/minitest-5
#	>=dev-ruby/mocha-0.14.0
#	<dev-ruby/mocha-0.15
#	>=dev-ruby/rake-10
#	dev-ruby/redis-store-testing
#	dev-ruby/tzinfo )"

RESTRICT="test"
