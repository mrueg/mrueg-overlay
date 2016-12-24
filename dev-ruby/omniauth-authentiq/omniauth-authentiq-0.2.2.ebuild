# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="This is the strategy for authenticating via Authentiq"
HOMEPAGE="https://rubygems.org/gems/omniauth-authentiq https://github.com/AuthentiqID/omniauth-authentiq"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-oauth2-1.3.1
	<dev-ruby/omniauth-oauth2-2"
