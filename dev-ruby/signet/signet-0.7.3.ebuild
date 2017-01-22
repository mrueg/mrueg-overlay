# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Signet is an OAuth 1.0 / OAuth 2.0 implementation.
"
HOMEPAGE="https://github.com/google/signet/ https://rubygems.org/gems/signet"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3
	<dev-ruby/addressable-3
	>=dev-ruby/faraday-0.9
	<dev-ruby/faraday-1
	>=dev-ruby/jwt-1.5
	<dev-ruby/jwt-2
	>=dev-ruby/multi_json-1.10
	<dev-ruby/multi_json-2"

ruby_add_bdepend ">=dev-ruby/kramdown-1.5
	<dev-ruby/kramdown-2
	>=dev-ruby/launchy-2.4
	<dev-ruby/launchy-3"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
}
