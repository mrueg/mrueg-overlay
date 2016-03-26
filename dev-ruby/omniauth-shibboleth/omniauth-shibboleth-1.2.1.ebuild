# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="OmniAuth Shibboleth strategies for OmniAuth 1.x"
HOMEPAGE="https://github.com/toyokazu/omniauth-shibboleth https://rubygems.org/gems/omniauth-shibboleth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.0.0"
ruby_add_bdepend "test? ( dev-ruby/rack-test )"
