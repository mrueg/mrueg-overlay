# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="CAS 3.0 Strategy for OmniAuth"
HOMEPAGE="https://github.com/tduehr/omniauth-cas3 https://rubygems.org/gems/omniauth-cas3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3
	<dev-ruby/addressable-3
	>=dev-ruby/nokogiri-1.6.6
	<dev-ruby/nokogiri-1.7
	>=dev-ruby/omniauth-1.2
	<dev-ruby/omniauth-2"
ruby_add_bdepend "test? ( >=dev-ruby/rack-test-0.6
	<dev-ruby/rack-test-1
	>=dev-ruby/webmock-1.19.0 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "/awesome_print/d" spec/spec_helper.rb || die
}
