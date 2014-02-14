# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md History.markdown"

inherit ruby-fakegem

DESCRIPTION="A CoffeeScript Converter for Jekyll"
HOMEPAGE="https://github.com/jekyll/jekyll-coffeescript"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e '/bundler/d' Rakefile || die
	sed -i -e "/^RSpec/i \
		require 'jekyll'"\
		-e "/^RSpec/i \
		require 'jekyll-coffeescript'" spec/spec_helper.rb || die
}

ruby_add_rdepend "dev-ruby/coffee-script"
ruby_add_bdepend "www-apps/jekyll"
