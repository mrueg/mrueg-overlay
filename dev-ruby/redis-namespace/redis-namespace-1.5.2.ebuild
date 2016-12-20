# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Redis::Namespace class which can be used to namespace calls to Redis"
HOMEPAGE="http://github.com/resque/redis-namespace https://rubygems.org/gems/redis-namespace"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test" # requires local redis server

ruby_add_rdepend ">=dev-ruby/redis-3.0.4
	<dev-ruby/redis-4"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" Rakefile spec/spec_helper.rb || die
}
