# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Constant time string comparison method safe for use in cryptographic functions"
HOMEPAGE="https://rubygems.org/gems/securecompare https://github.com/samuelkadolph/securecompare"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "dev-ruby/rake"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
