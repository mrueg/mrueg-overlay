# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Plugin for running methods on ActiveRecord models after record is committed"
HOMEPAGE="https://github.com/shellycloud/after_commit_queue https://rubygems.org/gems/after_commit_queue"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_bdepend ">=dev-ruby/rails-3.0
	dev-ruby/sqlite3"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" -e "/load/d" -e '/app:db/d' Rakefile || die
	sed -i -e "/Bundler/d" test/dummy/config/application.rb || die
	sed -i -e "/test_help/d" -e "/use_transactional_fixtures/d" test/test_helper.rb || die
}
