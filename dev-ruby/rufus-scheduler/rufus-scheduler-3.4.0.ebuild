# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Job scheduler for Ruby (at, cron, in and every jobs)"
HOMEPAGE="https://rubygems.org/gems/rufus-scheduler http://github.com/jmettraux/rufus-scheduler"
SRC_URI="https://github.com/jmettraux/rufus-scheduler/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/et-orbi"

ruby_add_bdepend "test? ( dev-ruby/chronic )"

each_ruby_test() {
	TZ=UTC RSPEC_VERSION=3 ruby-ng_rspec
}
