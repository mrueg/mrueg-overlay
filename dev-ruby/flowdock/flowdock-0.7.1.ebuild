# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Ruby Gem for using Flowdock's API"
HOMEPAGE="https://rubygems.org/gems/flowdock http://github.com/flowdock/flowdock-api"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0.7
	<dev-ruby/httparty-1
	dev-ruby/multi_json"
ruby_add_bdepend "test? ( dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e "1irequire 'securerandom'" spec/flowdock_spec.rb || die
}
