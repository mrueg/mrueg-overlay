# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_EXTRAINSTALL="init.rb"

inherit ruby-fakegem

DESCRIPTION="Allows to define default values for ActiveRecord models in a declarative manner"
HOMEPAGE="https://rubygems.org/gems/default_value_for https://github.com/FooBarWidget/default_value_for"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/activerecord-5.1
	>=dev-ruby/activerecord-3.2.0"

ruby_add_bdepend "test? (
	>=dev-ruby/minitest-4.2
	dev-ruby/minitest-around
	<dev-ruby/railties-5.1
	>=dev-ruby/railties-3.2.0 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" test.rb || die
}

each_ruby_test() {
	${RUBY} -Ilib test.rb || die
}
