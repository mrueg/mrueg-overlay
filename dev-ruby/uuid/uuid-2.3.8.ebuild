# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="UUID generator for producing universally unique identifiers based on RFC 4122"
HOMEPAGE="http://github.com/assaf/uuid https://rubygems.org/gems/uuid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/macaddr-1.0
	<dev-ruby/macaddr-2"

ruby_add_bdepend "test? ( dev-ruby/mocha
	dev-ruby/test-unit
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "11s/^/require \'mocha\/test_unit\'\n/" test/test-uuid.rb || die
}
