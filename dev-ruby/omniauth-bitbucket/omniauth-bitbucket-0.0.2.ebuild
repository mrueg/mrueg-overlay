# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="OmniAuth strategy for Bitbucket"
HOMEPAGE="https://github.com/sishen/omniauth-bitbucket https://rubygems.org/gems/omniauth-bitbucket"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/multi_json-1.7
	<dev-ruby/multi_json-2
	>=dev-ruby/omniauth-1.1
	<dev-ruby/omniauth-2
	>=dev-ruby/omniauth-oauth-1.0
	<dev-ruby/omniauth-oauth-2"
ruby_add_bdepend "test? ( dev-ruby/rack-test
	dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
}
