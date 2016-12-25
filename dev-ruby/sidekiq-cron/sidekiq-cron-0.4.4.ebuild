# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Enables to set jobs to be run in specified time (using CRON notation)"
HOMEPAGE="http://github.com/ondrejbartas/sidekiq-cron https://github.com/ondrejbartas/sidekiq-cron.git https://rubygems.org/gems/sidekiq-cron"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-namespace-1.5.2
	>=dev-ruby/rufus-scheduler-2.0.24
	>=dev-ruby/sidekiq-4.2.1"
ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/mocha
	dev-ruby/rack
	dev-ruby/rack-test
	dev-ruby/shotgun
	dev-ruby/shoulda-context
	dev-ruby/sinatra
	dev-ruby/slim
	dev-ruby/test-unit )"

all_ruby_prepare() {
	sed -i -e "/bundler/,+16d" test/test_helper.rb || die
	sed -i -e "/bundler/,+10d" -e "/jeweler/,+12d" Rakefile || die
}

RESTRICT="test" # requires local redis server
