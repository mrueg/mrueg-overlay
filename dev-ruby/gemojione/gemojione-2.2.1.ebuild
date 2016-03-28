# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="test"
RUBY_FAKEGEM_EXTRAINSTALL="assets config"
RUBY_FAKEGEM_EXTRA_DOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A gem for EmojiOne"
HOMEPAGE="http://github.com/jonathanwiesel/gemojione https://rubygems.org/gems/gemojione"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/json"

ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile test/test_helper.rb || die
}
