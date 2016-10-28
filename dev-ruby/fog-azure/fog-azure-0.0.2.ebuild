# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Azure module for fog"
HOMEPAGE="https://rubygems.org/gems/fog-azure https://github.com/fog/fog-azure http://github.com/fog/fog-azure"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/azure-0.6
	<dev-ruby/azure-1
	>=dev-ruby/fog-core-1.27
	<dev-ruby/fog-core-2
	>=dev-ruby/fog-json-1.0
	<dev-ruby/fog-json-2
	>=dev-ruby/fog-xml-0.1
	<dev-ruby/fog-xml-1"

ruby_add_bdepend "test? (
	>=dev-ruby/shindo-0.3
	<dev-ruby/shindo-1 )"

RUBY_PATCHES=( "${FILESDIR}"/${P}-fix-tests.patch )

all_ruby_prepare() {
	sed -i -e "/Bundler/d" tests/helper.rb || die
}

each_ruby_test() {
	FOG_MOCK=true ${RUBY} -S shindont || die
}
