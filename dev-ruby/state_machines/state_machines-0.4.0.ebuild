# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_TASK_TEST="unit functional"

inherit ruby-fakegem

DESCRIPTION="Adds support for creating state machines for attributes on any Ruby class"
HOMEPAGE="https://github.com/state-machines/state_machines https://rubygems.org/gems/state_machines"
SRC_URI="https://github.com/state-machines/state_machines/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.4
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
	sed -i -e "/[Rr]eporters/d" test/test_helper.rb || die
}
