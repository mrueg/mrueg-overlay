# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Stub constants for the duration of a block in MiniTest"
HOMEPAGE="https://rubygems.org/gems/minitest-stub-const https://github.com/adammck/minitest-stub-const"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest:5 )"

each_ruby_test() {
	${RUBY} -Ilib test/test_stub_const.rb || die
}
