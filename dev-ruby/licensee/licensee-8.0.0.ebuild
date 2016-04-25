# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A Ruby Gem to detect under what license a project is distributed"
HOMEPAGE="https://rubygems.org/gems/licensee https://github.com/benbalter/licensee"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rugged-0.24"

ruby_add_bdepend "test? (
	>=dev-ruby/rake-10.3
	>=dev-ruby/shoulda-3.5
	<dev-ruby/shoulda-4 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" test/helper.rb || die
}
