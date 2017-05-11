# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="JSON Web Token and its family (ignature,Encryption and Key)"
HOMEPAGE="https://github.com/nov/json-jwt https://rubygems.org/gems/json-jwt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport
	dev-ruby/bindata
	>=dev-ruby/multi_json-1.3
	dev-ruby/securecompare
	dev-ruby/url_safe_base64"

ruby_add_bdepend "test? ( dev-ruby/rspec-its )"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+5d" spec/spec_helper.rb || die
}
