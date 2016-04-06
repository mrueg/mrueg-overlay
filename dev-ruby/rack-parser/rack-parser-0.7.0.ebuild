# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Rack Middleware for parsing post data for JSON, XML and various content types"
HOMEPAGE="https://github.com/achiu/rack-parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rack"
ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}

each_ruby_test() {
	${RUBY} spec/parser_spec.rb || die
}
