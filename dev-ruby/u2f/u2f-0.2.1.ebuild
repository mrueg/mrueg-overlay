# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Library for handling registration and authentication of U2F devices"
HOMEPAGE="https://github.com/castle/ruby-u2f https://rubygems.org/gems/u2f"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/json_expressions-0.8.3
	<dev-ruby/json_expressions-0.9 )"

all_ruby_prepare() {
	sed -i -e "1,10d" spec/spec_helper.rb || die
}
