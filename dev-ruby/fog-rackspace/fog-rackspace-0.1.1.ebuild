# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Rackspace provider gem for Fog"
HOMEPAGE="https://github.com/fog/fog-rackspace https://rubygems.org/gems/fog-rackspace http://developer.rackspace.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-core-1.35
	>=dev-ruby/fog-json-1.0
	>=dev-ruby/fog-xml-0.1
	>=dev-ruby/ipaddress-0.8"

ruby_add_bdepend "
	dev-ruby/mime-types
	dev-ruby/mime-types-data
	>=dev-ruby/vcr-3.0.1:3
	>=dev-ruby/shindo-0.3
	<dev-ruby/shindo-1"

all_ruby_prepare() {
	sed -i -e "/Bundler/d" tests/helper.rb || die
}

each_ruby_test() {
	FOG_MOCK=true ${RUBY} -S shindont || die
}
