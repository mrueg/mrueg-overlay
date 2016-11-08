# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Adds support for creating state machines for attributes on ActiveModel"
HOMEPAGE="https://github.com/state-machines/state_machines-activemodel https://rubygems.org/gems/state_machines-activemodel"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.1
	<dev-ruby/activemodel-5.1
	>=dev-ruby/state_machines-0.4.0"
ruby_add_bdepend "test? (
	>=dev-ruby/minitest-5.4
	<dev-ruby/minitest-6
	>=dev-ruby/rake-10 )"

all_ruby_prepare() {
	sed -i -e "/[Rr]eporters/d" test/test_helper.rb || die
}
