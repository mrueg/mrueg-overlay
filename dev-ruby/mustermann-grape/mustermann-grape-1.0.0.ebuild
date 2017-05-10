# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Adds Grape style patterns to Mustermann"
HOMEPAGE="https://github.com/rkh/mustermann https://rubygems.org/gems/mustermann-grape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/mustermann-1.0.0
	<dev-ruby/mustermann-1.1"
