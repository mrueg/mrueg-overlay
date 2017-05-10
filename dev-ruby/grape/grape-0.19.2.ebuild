# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="A Ruby framework for rapid API development with great conventions"
HOMEPAGE="https://rubygems.org/gems/grape https://github.com/ruby-grape/grape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport
	dev-ruby/builder
	>=dev-ruby/hashie-2.1.0
	>=dev-ruby/multi_json-1.3.2
	>=dev-ruby/multi_xml-0.5.2
	>=dev-ruby/mustermann-grape-1.0.0
	<dev-ruby/mustermann-grape-1.1.0
	>=dev-ruby/rack-1.3.0
	dev-ruby/rack-accept
	>=dev-ruby/virtus-1.0.0"

ruby_add_bdepend "test? (
	dev-ruby/cookiejar
	>=dev-ruby/hashie-3
	dev-ruby/mime-types:3
	dev-ruby/rack-jsonp
	dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" -e "1irequire 'rack/jsonp'" -e "1irequire 'rack/test'"\
		-e "1irequire 'mime-types'" -e "1igem 'mime-types', '~>3.0'" -e "1irequire 'cookiejar'"\
		-e "/[Cc]overalls/d" \
		spec/spec_helper.rb || die
}
