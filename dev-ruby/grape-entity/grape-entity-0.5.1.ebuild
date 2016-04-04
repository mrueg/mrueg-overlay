# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Extracted from Grape, a framework for rapid API development"
HOMEPAGE="https://github.com/ruby-grape/grape-entity https://rubygems.org/gems/grape-entity"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/activesupport
	>=dev-ruby/multi_json-1.3.2"
ruby_add_bdepend "test? (
	dev-ruby/maruku
	dev-ruby/rake
	dev-ruby/rails )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" -e "s/pry/grape_entity/" -e "1s/^/require \'rails\'\n/" spec/spec_helper.rb || die
}
