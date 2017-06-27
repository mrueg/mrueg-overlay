# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="Integration tool for testing infrastructure code on isolated target platforms"
HOMEPAGE="http://kitchen.ci https://rubygems.org/gems/test-kitchen https://github.com/test-kitchen/test-kitchen"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/mixlib-install-3.0
	>=dev-ruby/mixlib-install-1.2
	<dev-ruby/mixlib-shellout-3.0
	>=dev-ruby/mixlib-shellout-1.2
	>=dev-ruby/net-scp-1.1
	<dev-ruby/net-scp-2
	<dev-ruby/net-ssh-5.0
	>=dev-ruby/net-ssh-2.9
	>=dev-ruby/net-ssh-gateway-1.2
	<dev-ruby/net-ssh-gateway-1.3
	>=dev-ruby/safe_yaml-1.0
	<dev-ruby/safe_yaml-2
	>=dev-ruby/thor-0.19
	<dev-ruby/thor-0.19.2"

ruby_add_bdepend "test? ( >=dev-ruby/fakefs-0.4
	<dev-ruby/fakefs-1
	>=dev-ruby/minitest-5.3
	<dev-ruby/minitest-6
	>=dev-ruby/mocha-1.1
	<dev-ruby/mocha-2
	>=dev-ruby/rake-10.0 )
	doc? ( >=dev-ruby/maruku-0.6
	 <dev-ruby/maruku-1 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
	rm spec/kitchen/transport/winrm_spec.rb || die
}

each_ruby_test() {
	${RUBY} -S rake unit || die
}
