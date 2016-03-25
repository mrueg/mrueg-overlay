# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rake"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A set of Rails responders to dry up your application"
HOMEPAGE="https://github.com/plataformatec/responders"
SRC_URI="https://github.com/plataformatec/responders/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-4.2.0
	<dev-ruby/railties-5.1"

ruby_add_bdepend "test? ( dev-ruby/minitest
	>=dev-ruby/activemodel-4.2
	dev-ruby/mocha )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile test/test_helper.rb || die
}
