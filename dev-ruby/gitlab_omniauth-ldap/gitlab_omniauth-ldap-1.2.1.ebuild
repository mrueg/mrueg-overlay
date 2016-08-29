# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A LDAP strategy for OmniAuth - Gitlab Fork"
HOMEPAGE="https://github.com/gitlabhq/omniauth-ldap https://rubygems.org/gems/gitlab_omniauth-ldap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby-net-ldap-0.9
	<dev-ruby/ruby-net-ldap-1
	>=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2
	>=dev-ruby/pyu-ruby-sasl-0.0.3.1
	<dev-ruby/pyu-ruby-sasl-0.0.4
	>=dev-ruby/rubyntlm-0.3
	<dev-ruby/rubyntlm-1"
