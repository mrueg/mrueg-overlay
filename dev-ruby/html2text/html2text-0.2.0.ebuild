# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_TASK_DOC=""
inherit ruby-fakegem

DESCRIPTION="A Ruby component to convert HTML into a plain text format"
HOMEPAGE="https://rubygems.org/gems/html2text https://github.com/soundasleep/html2text_ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.6
	<dev-ruby/nokogiri-2"

ruby_add_bdepend "test? ( dev-ruby/rspec-collection_matchers )"
