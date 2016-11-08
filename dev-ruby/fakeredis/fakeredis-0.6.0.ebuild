# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Fake (In-memory) driver for redis-rb. Useful for testing without Redis"
HOMEPAGE="https://guilleiguaran.github.com/fakeredis https://rubygems.org/gems/fakeredis"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redis-3.2
	<dev-ruby/redis-4"

all_ruby_prepare() {
	sed -i "1irequire 'fakeredis/version'" spec/spec_helper.rb || die
}
