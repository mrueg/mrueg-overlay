# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Official OmniAuth strategy for GitHub"
HOMEPAGE="https://github.com/intridea/omniauth-github https://rubygems.org/gems/omniauth-github"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2
	>=dev-ruby/omniauth-oauth2-1.1
	<dev-ruby/omniauth-oauth2-2"
ruby_add_bdepend "dev-ruby/rack-test
	dev-ruby/webmock"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
}
