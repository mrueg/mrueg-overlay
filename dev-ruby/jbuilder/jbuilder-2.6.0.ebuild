# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Create JSON structures via a Builder-style DSL"
HOMEPAGE="https://rubygems.org/gems/jbuilder https://github.com/rails/jbuilder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/activesupport-5.1
	>=dev-ruby/activesupport-3.0.0
	>=dev-ruby/multi_json-1.2
	<dev-ruby/multi_json-2"

ruby_add_bdepend "test? ( dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" test/test_helper.rb Rakefile || die
}

each_ruby_test() {
	TRAVIS=true ${RUBY} -S rake test || die
}
