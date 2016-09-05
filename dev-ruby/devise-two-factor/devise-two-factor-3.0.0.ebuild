# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Barebones two-factor authentication with Devise"
HOMEPAGE="https://github.com/tinfoil/devise-two-factor https://rubygems.org/gems/devise-two-factor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport
	!=dev-ruby/attr_encrypted-2
	<dev-ruby/attr_encrypted-4
	>=dev-ruby/attr_encrypted-1.3
	>=dev-ruby/devise-4.0
	<dev-ruby/devise-5
	dev-ruby/railties
	>=dev-ruby/rotp-2.0
	<dev-ruby/rotp-3"

ruby_add_bdepend "test? ( dev-ruby/activemodel
	dev-ruby/faker
	>dev-ruby/rspec-3
	dev-ruby/timecop )"

all_ruby_prepare() {
	sed -i -e "1,16d" spec/spec_helper.rb || die
}
