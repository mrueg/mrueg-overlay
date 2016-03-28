# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="Performance management system providing information about web apps"
HOMEPAGE="https://github.com/newrelic/rpm https://rubygems.org/gems/newrelic_rpm"

LICENSE="MIT Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

#ruby_add_bdepend "test? ( >=dev-ruby/hometown-0.2.5
#	<dev-ruby/hometown-0.3
#	>=dev-ruby/i18n-0.6.11
#	>=dev-ruby/minitest-4.7.5
#	>=dev-ruby/mocha-0.13.0
#	>=dev-ruby/rails-3.2.13
#	>=dev-ruby/rake-10.1.0
#	dev-ruby/sqlite3 )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" test/test_helper.rb || die
}
