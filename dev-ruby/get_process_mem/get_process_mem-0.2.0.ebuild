# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"

inherit ruby-fakegem

DESCRIPTION="Get memory usage of a process in Ruby"
HOMEPAGE="https://rubygems.org/gems/get_process_mem https://github.com/schneems/get_process_mem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend ">=dev-ruby/rake-10.1"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" test/test_helper.rb Rakefile || die
}
