# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Ruby tool for truncating HTML strings keeping a valid HTML markup"
HOMEPAGE="https://github.com/jorgemanrubia/truncato https://rubygems.org/gems/truncato"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/htmlentities-4.3.1
	<dev-ruby/htmlentities-4.4
	>=dev-ruby/nokogiri-1.6.1
	<dev-ruby/nokogiri-1.7"
