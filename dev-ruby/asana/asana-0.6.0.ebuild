# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Official Ruby client for the Asana API"
HOMEPAGE="https://github.com/asana/ruby-asana https://rubygems.org/gems/asana"
SRC_URI="https://github.com/Asana/ruby-asana/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RUBY_S=ruby-${P}

ruby_add_rdepend ">=dev-ruby/faraday-0.9
	<dev-ruby/faraday-1
	>=dev-ruby/faraday_middleware-0.9
	<dev-ruby/faraday_middleware-1
	<dev-ruby/faraday_middleware-multi_json-1
	>=dev-ruby/oauth2-1.0
	<dev-ruby/oauth2-2"

all_ruby_prepare() {
	sed -i "/simplecov/,+13d" spec/spec_helper.rb || die
}
