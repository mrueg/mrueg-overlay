# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A DSL to retry failed code blocks with randomized exponential backoff"
HOMEPAGE="https://github.com/kamui/retriable http://github.com/kamui/retriable https://rubygems.org/gems/retriable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.10
	<dev-ruby/minitest-6
	>=dev-ruby/rake-10.4 )"

all_ruby_prepare() {
	sed -i -e "/codeclimate-test-reporter/,+14d" spec/spec_helper.rb -e "/awesome_print/d" -e "/pry/d" -e "/focus/d"|| die
}
