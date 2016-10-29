# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_RECIPE_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Small library to parse plain text email content"
HOMEPAGE="https://github.com/github/email_reply_parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="re2"

ruby_add_rdepend "re2? ( dev-ruby/re2 )"
ruby_add_bdepend "test? ( dev-ruby/re2 )"

each_ruby_test() {
		${RUBY} -Ilib:test test/email_reply_parser_test.rb || die
}
