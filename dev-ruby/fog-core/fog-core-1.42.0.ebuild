# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="Shared classes and tests for fog providers and services"
HOMEPAGE="https://github.com/fog/fog-core https://rubygems.org/gems/fog-core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/builder
	>=dev-ruby/excon-0.49
	<dev-ruby/excon-1
	>=dev-ruby/formatador-0.2
	<dev-ruby/formatador-1"

ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/minitest-stub-const
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "1,8d" spec/spec_helper.rb || die
	sed -i -e "13,23d" -e "/bundler/d" Rakefile || die
}
