# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Test Rails generators with RSpec"
HOMEPAGE="https://rubygems.org/gems/generator_spec https://github.com/stevehodgkiss/generator_spec"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0
	>=dev-ruby/railties-3.0.0"

all_ruby_prepare() {
	sed -i -e "s/bundler\/setup/pathname/" spec/spec_helper.rb || die
}

RESTRICT="test" # weird things happen, need to investigate
