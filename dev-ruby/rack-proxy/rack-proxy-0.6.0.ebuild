# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Rack app providing request/response rewriting proxy capabilities with streaming"
HOMEPAGE="https://rubygems.org/gems/rack-proxy https://github.com/ncr/rack-proxy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rack"

ruby_add_bdepend "dev-ruby/rack-test
	dev-ruby/test-unit"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" Rakefile test/test_helper.rb || die
	sed -i -e "/Google always sets a cookie/ s/^/#/" test/rack_proxy_test.rb || die
}
