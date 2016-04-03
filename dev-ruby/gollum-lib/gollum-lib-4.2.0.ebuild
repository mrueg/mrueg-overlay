# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_DOC_DIR="docs"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="test"

inherit ruby-fakegem

DESCRIPTION="A simple, Git-powered wiki with a sweet API and local frontend"
HOMEPAGE="http://github.com/gollum/gollum-lib https://rubygems.org/gems/gollum-lib"
SRC_URI="https://github.com/gollum/gollum-lib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/github-markup-1.4.0
	>=dev-ruby/gollum-grit_adapter-1.0
	<dev-ruby/gollum-grit_adapter-2
	>=dev-ruby/nokogiri-1.6.4
	<dev-ruby/nokogiri-1.7
	>=dev-ruby/rouge-1.10
	<dev-ruby/rouge-2
	>=dev-ruby/sanitize-2.1.0:0
	>=dev-ruby/stringex-2.5.1
	<dev-ruby/stringex-2.6"

ruby_add_bdepend "test? ( >=dev-ruby/org-ruby-0.9.9
	>=dev-ruby/kramdown-1.6.0
	>=dev-ruby/redcloth-4.2.9
	>=dev-ruby/mocha-1.1.0:1.0
	>=dev-ruby/wikicloth-0.8.3
	>=dev-ruby/rake-10.4.0
	>=dev-ruby/test-unit-3.1.5
	>=dev-ruby/nokogiri-diff-0.2.0 )"

all_ruby_prepare() {
	# twitter_cdlr not packaged
	sed -i -e "/twitter_cldr/d" -e "/[Rr]eporters/d" test/helper.rb || die
	sed -i -e "/def nfd(utf8)/,+32d" test/test_unicode.rb || die
}
