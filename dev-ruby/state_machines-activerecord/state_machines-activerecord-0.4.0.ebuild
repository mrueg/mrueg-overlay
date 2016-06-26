# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Adds support for creating state machines for attributes on ActiveRecord"
HOMEPAGE="https://rubygems.org/gems/state_machines-activerecord https://github.com/state-machines/state_machines-activerecord/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.1
	<dev-ruby/activerecord-5.1
	>=dev-ruby/state_machines-activemodel-0.3.0"
ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.4.0
	>=dev-ruby/rake-10.3
	>=dev-ruby/activerecord-4.1[sqlite]
	>=dev-ruby/sqlite3-1.3
	<dev-ruby/sqlite3-2 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile  || die
	sed -i -e "/[Rr]eporters/d" test/test_helper.rb || die
}
