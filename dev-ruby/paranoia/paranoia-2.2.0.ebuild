# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md CONTRIBUTING.md README.md"

inherit ruby-fakegem

DESCRIPTION="Re-implementation of acts_as_paranoid"
HOMEPAGE="https://rubygems.org/gems/paranoia"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-4.0
	<dev-ruby/activerecord-5.1"
ruby_add_bdepend "test? ( dev-ruby/rake
	>=dev-ruby/activerecord-4.0[sqlite] )"

all_ruby_prepare() {
	sed -i -e "/{Bb]undler/d" Rakefile || die
	sed -i -e "/:jruby/,+3d" Gemfile || die
}
