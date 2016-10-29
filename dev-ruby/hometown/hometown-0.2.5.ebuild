# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Track object creation to stamp out pesky leaks"
HOMEPAGE="https://rubygems.org/gems/hometown http://github.com/jasonrclark/hometown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? (
	>=dev-ruby/minitest-5.3
	<dev-ruby/minitest-6
	>=dev-ruby/rake-10.2 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
