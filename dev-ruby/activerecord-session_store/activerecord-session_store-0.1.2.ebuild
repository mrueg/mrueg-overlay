# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="An Action Dispatch session store backed by an Active Record class."
HOMEPAGE="https://rubygems.org/gems/activerecord-session_store https://github.com/rails/activerecord-session_store"
SRC_URI="https://github.com/rails/activerecord-session_store/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/actionpack-5
	>=dev-ruby/actionpack-4.0.0
	<dev-ruby/activerecord-5
	>=dev-ruby/activerecord-4.0.0
	<dev-ruby/railties-5
	>=dev-ruby/railties-4.0.0"
ruby_add_bdepend "test? ( >=dev-ruby/activerecord-4[sqlite]
	dev-ruby/minitest
	dev-ruby/rake
	dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile test/helper.rb || die
	sed -i -e "s/-w/-w -Ilib/" Rakefile || die
}
