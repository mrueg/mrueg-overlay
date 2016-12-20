# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="An OmniAuth provider for Atlassian Crowd's REST API"
HOMEPAGE="http://github.com/robdimarco/omniauth_crowd https://rubygems.org/gems/omniauth_crowd"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport
	>=dev-ruby/nokogiri-1.4.4
	>=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2"
ruby_add_bdepend "test? ( dev-ruby/rack
	dev-ruby/rack-test
	dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" spec/spec_helper.rb || die
}
