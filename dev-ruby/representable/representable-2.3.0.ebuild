# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Renders and parses JSON/XML/YAML documents from and to Ruby objects"
HOMEPAGE="https://rubygems.org/gems/representable https://github.com/apotonick/representable/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/uber-0.0.7
	<dev-ruby/uber-0.1"

ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/rake
	dev-ruby/ruby-prof
	=dev-ruby/test_xml-0.1.6
	dev-ruby/virtus
	>=dev-ruby/json-1.7.7 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
	sed -i -e "1irequire 'psych'\nrequire 'json'" test/test_helper.rb || die
	rm test/mongoid_test.rb || die
}
