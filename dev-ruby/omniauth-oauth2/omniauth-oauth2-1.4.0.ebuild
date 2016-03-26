# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="An abstract OAuth2 strategy for OmniAuth"
HOMEPAGE="https://github.com/intridea/omniauth-oauth2 https://rubygems.org/gems/omniauth-oauth2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/oauth2-1.0
	<dev-ruby/oauth2-2
	>=dev-ruby/omniauth-1.2
	<dev-ruby/omniauth-2"

ruby_add_bdepend "test? ( dev-ruby/webmock
	dev-ruby/omniauth
	dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/,+7d" spec/helper.rb || die
}
