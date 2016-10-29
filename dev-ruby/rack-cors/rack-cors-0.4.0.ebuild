# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rake"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.md"

inherit ruby-fakegem

DESCRIPTION="Middleware that will make Rack-based apps CORS compatible"
HOMEPAGE="https://github.com/cyu/rack-cors"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.3.0:5
	dev-ruby/rake
	dev-ruby/mocha:0.14
	dev-ruby/rack-test )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
