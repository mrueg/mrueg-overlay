# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG"

inherit ruby-fakegem

DESCRIPTION="Namespaced Rack, I18n and cache Redis stores"
HOMEPAGE="https://rubygems.org/gems/redis-store http://redis-store.org/redis-store https://github.com/jodosha/redis-store/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-2.2"

#ruby_add_bdepend "test? ( 
#	>=dev-ruby/git-1.2
#	<dev-ruby/git-2
#	>=dev-ruby/minitest-5
#	dev-ruby/mocha:0.14
#	>=dev-ruby/rake-10
#	dev-ruby/redis-store-testing )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile test/test_helper.rb || die
}

RESTRICT="test"
