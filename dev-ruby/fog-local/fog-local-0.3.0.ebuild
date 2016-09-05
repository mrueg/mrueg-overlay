# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A fog provider to use local filesystem storage"
HOMEPAGE="https://rubygems.org/gems/fog-local https://github.com/fog/fog-local"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-core-1.27
	<dev-ruby/fog-core-2"

ruby_add_bdepend "test? ( >=dev-ruby/rake-10.0
	>=dev-ruby/shindo-0.3
	<dev-ruby/shindo-1 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "/bundle exec/d" Rakefile || die
	sed -i -e "1,6d" -e "/Bundler/d" tests/helper.rb || die
}

each_ruby_test() {
	${RUBY} -S shindont || die
}
