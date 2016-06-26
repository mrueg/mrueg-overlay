# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Natural language parser for elapsed time"
HOMEPAGE="https://rubygems.org/gems/chronic_duration https://github.com/hpoydar/chronic_duration"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/numerizer-0.1.1"

ruby_add_bdepend ">=dev-ruby/rake-10.0.3"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile spec/spec_helper.rb || die
}
