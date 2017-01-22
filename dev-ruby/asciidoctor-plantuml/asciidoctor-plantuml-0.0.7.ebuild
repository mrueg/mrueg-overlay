# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Asciidoctor PlantUML extension"
HOMEPAGE="https://github.com/hsanson/asciidoctor-plantuml https://rubygems.org/gems/asciidoctor-plantuml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/asciidoctor-1.5
	<dev-ruby/asciidoctor-2"

ruby_add_bdepend "test? ( >=dev-ruby/nokogiri-1.6
	<dev-ruby/nokogiri-2 )"

each_ruby_test() {
	${RUBY} -I lib test/test_plantuml.rb || die
}
