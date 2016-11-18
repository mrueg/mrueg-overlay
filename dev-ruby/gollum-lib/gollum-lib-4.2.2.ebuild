# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_DOC_DIR="docs"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="test"

inherit ruby-fakegem

DESCRIPTION="A simple, Git-powered wiki with a sweet API and local frontend"
HOMEPAGE="http://github.com/gollum/gollum-lib https://rubygems.org/gems/gollum-lib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/github-markup-1.4
	<dev-ruby/github-markup-2
	>=dev-ruby/gollum-grit_adapter-1.0
	<dev-ruby/gollum-grit_adapter-2
	>=dev-ruby/nokogiri-1.6.4
	<dev-ruby/nokogiri-1.7
	>=dev-ruby/rouge-2
	<dev-ruby/rouge-3
	>=dev-ruby/sanitize-2.1:0
	>=dev-ruby/stringex-2.6.0
	<dev-ruby/stringex-3"
