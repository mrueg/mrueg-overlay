# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A library for implementing the client side of a SAML authorization"
HOMEPAGE="http://github.com/onelogin/ruby-saml https://rubygems.org/gems/ruby-saml"
LICENSE="MIT"
SLOT="0.8"
KEYWORDS="~amd64"

IUSE="doc"

ruby_add_rdepend ">=dev-ruby/nokogiri-1.5.10
	>=dev-ruby/uuid-2.3
	<dev-ruby/uuid-3"

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.5:5
	>=dev-ruby/mocha-0.14:0.14
	>=dev-ruby/shoulda-2.11
	<dev-ruby/shoulda-3
	>=dev-ruby/systemu-2
	dev-ruby/timecop )"

all_ruby_prepare() {
	sed -i -e '/ruby-debug/d' \
		-e '/bundler/I s:^:#:' \
		-e '/simplecov/ s:^:#:' \
		-e '/SimpleCov/,/end/ s:^:#:' test/test_helper.rb || die

	sed -i -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die

	sed -i -e '2i gem "shoulda", "~> 2.11"' test/test_helper.rb || die

	sed -i -e '3irequire "onelogin/ruby-saml/http_error"' test/idp_metadata_parser_test.rb || die
}
