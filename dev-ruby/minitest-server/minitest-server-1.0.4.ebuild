# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A client/server setup with your minitest process"
HOMEPAGE="https://github.com/seattlerb/minitest-server https://rubygems.org/gems/minitest-server"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.0
	<dev-ruby/minitest-6"

each_ruby_test() {
	${RUBY} -Ilib test/minitest/test_server.rb || die
}
