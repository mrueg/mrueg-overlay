# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Protocol Buffers are Google's data interchange format"
HOMEPAGE="https://rubygems.org/gems/google-protobuf https://developers.google.com/protocol-buffers"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/test-unit-3.0.9
	<dev-ruby/test-unit-4 )"

each_ruby_configure() {
	${RUBY} -Cext/google/protobuf_c extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/google/protobuf_c
	cp ext/google/protobuf_c/protobuf_c$(get_modname) lib/google/ || die
}

each_ruby_test() {
	${RUBY} -Ilib tests/basic.rb || die
	${RUBY} -Ilib tests/stress.rb || die
}
