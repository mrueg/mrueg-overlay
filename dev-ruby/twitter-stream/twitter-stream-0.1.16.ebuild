# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Simple Ruby client library for twitter streaming API"
HOMEPAGE="http://github.com/voloko/twitter-stream https://rubygems.org/gems/twitter-stream"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.7
	>=dev-ruby/http_parser_rb-0.5.1
	>=dev-ruby/simple_oauth-0.1.4"

all_ruby_prepare() {
	# Fix for >=eventmachine-1.0
	sed -i -e "s/&& !@buffer.empty?//" -e "s/, MAX_LINE_LENGTH//" lib/twitter/json_stream.rb || die
	sed -i -e "s/0.1.4/'0.1'/" -e "s/0.5.1/'0.5'/" ../metadata || die
}
