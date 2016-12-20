# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A generic SAML strategy for OmniAuth"
HOMEPAGE="https://github.com/omniauth/omniauth-saml https://rubygems.org/gems/omniauth-saml"
SRC_URI="https://github.com/omniauth/omniauth-saml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.3
	<dev-ruby/omniauth-2
	>=dev-ruby/ruby-saml-1.4
	<dev-ruby/ruby-saml-2"
ruby_add_bdepend "test? ( >=dev-ruby/rack-test-0.6
	<dev-ruby/rack-test-1 )"

all_ruby_prepare() {
	sed -i -e "/RUBY_VERSION/,+10d" spec/spec_helper.rb || die
}
