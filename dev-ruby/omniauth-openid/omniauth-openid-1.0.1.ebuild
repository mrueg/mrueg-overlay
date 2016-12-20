# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="OpenID strategy for OmniAuth"
HOMEPAGE="https://rubygems.org/gems/omniauth-openid https://github.com/intridea/omniauth-openid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2
	>=dev-ruby/rack-openid-1.3.1"

ruby_add_bdepend "test? ( >=dev-ruby/rack-test-0.5
	<dev-ruby/rack-test-1
	>=dev-ruby/webmock-1.7
	<dev-ruby/webmock-2 )"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
	sed -i -e "s/1.3.1/'1.3'/" ../metadata || die
}
