# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit multilib ruby-fakegem

DESCRIPTION="High Performance Haml Implementation"
HOMEPAGE="https://github.com/k0kubun/hamlit https://rubygems.org/gems/hamlit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/temple-0.7.6
	<dev-ruby/temple-0.8
	dev-ruby/thor
	dev-ruby/tilt"

RESTRICT="test"

#ruby_add_bdepend "dev-ruby/bundler
#	dev-ruby/coffee-script
#	dev-ruby/erubis
#	=dev-ruby/haml-4.1.0.beta.1
#	dev-ruby/less
#	>=dev-ruby/minitest-reporters-1.1
#	<dev-ruby/minitest-reporters-2
#	>=dev-ruby/rails-4.0.0
#	>=dev-ruby/rake-10.0
#	<dev-ruby/rake-11
#	dev-ruby/rake-compiler
#	dev-ruby/redcarpet
#	dev-ruby/sass
#	dev-ruby/slim
#	dev-ruby/unindent"

each_ruby_configure() {
	${RUBY} -Cext/${PN} extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/${PN}
	cp ext/${PN}/${PN}$(get_modname) lib/${PN}/ || die
}
