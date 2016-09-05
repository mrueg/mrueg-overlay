# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="AWS module for fog"
HOMEPAGE="https://github.com/fog/fog-aws https://rubygems.org/gems/fog-aws"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-core-1.38
	<dev-ruby/fog-core-2
	>=dev-ruby/fog-json-1.0
	<dev-ruby/fog-json-2
	>=dev-ruby/fog-xml-0.1
	<dev-ruby/fog-xml-1
	>=dev-ruby/ipaddress-0.8
	<dev-ruby/ipaddress-1"

#ruby_add_bdepend "test? ( >=dev-ruby/rake-10.0
#	>=dev-ruby/rubyzip-0.9.9
#	<dev-ruby/rubyzip-1
#	>=dev-ruby/shindo-0.3
#	<dev-ruby/shindo-1 )"

RESTRICT="test"

all_ruby_prepare() {
	sed -i -e "1,6d" -e "/Bundler/d" tests/helper.rb || die
}

each_ruby_test() {
	${RUBY} -S shindont || die
}
