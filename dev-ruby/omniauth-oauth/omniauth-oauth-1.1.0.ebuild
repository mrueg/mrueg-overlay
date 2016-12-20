# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A generic OAuth (1.0/1.0a) strategy for OmniAuth"
HOMEPAGE="https://rubygems.org/gems/omniauth-oauth https://github.com/intridea/omniauth-oauth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/oauth
	>=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+3d" spec/helper.rb || die
}
