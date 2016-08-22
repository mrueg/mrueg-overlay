# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="OAuth 2.0 Server & Client Library. Both Bearer and MAC token type are supported."
HOMEPAGE="https://rubygems.org/gems/rack-oauth2 http://github.com/nov/rack-oauth2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/activesupport-2.3
	>=dev-ruby/attr_required-0.0.5
	>=dev-ruby/httpclient-2.4
	>=dev-ruby/multi_json-1.3.6
	>=dev-ruby/rack-1.1"

#ruby_add_bdepend "test? ( dev-ruby/rspec-its
#<dev-ruby/webmock-1.24 )"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+4d" spec/spec_helper.rb || die
}
