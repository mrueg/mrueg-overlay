# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Provides automatic parsing for any given JSON Schema"
HOMEPAGE="http://autoparse.rubyforge.org/ https://rubygems.org/gems/autoparse"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3.1
	>=dev-ruby/extlib-0.9.15
	>=dev-ruby/multi_json-1.0.0"

ruby_add_bdepend "test? ( >=dev-ruby/launchy-2.1.1 )"
