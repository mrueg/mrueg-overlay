# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A OmniAuth strategy to authenticate using different password strategies"
HOMEPAGE="https://rubygems.org/gems/omniauth-multipassword https://github.com/jgraichen/omniauth-multipassword"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2"

ruby_add_bdepend "test? ( dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+9d" spec/spec_helper.rb || die
}
