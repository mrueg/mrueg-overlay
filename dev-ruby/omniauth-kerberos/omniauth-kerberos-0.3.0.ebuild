# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="An OmniAuth strategy for Kerberos"
HOMEPAGE="https://github.com/jgraichen/omniauth-kerberos https://rubygems.org/gems/omniauth-kerberos"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/omniauth-multipassword
	>=dev-ruby/timfel-krb5-auth-0.8
	<dev-ruby/timfel-krb5-auth-1"

ruby_add_bdepend "test? ( dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/CI/,+6d" spec/spec_helper.rb || die
}
