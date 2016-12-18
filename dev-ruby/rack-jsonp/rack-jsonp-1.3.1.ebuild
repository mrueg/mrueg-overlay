# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="A Rack middleware for providing JSON-P support"
HOMEPAGE="http://github.com/crohr/rack-jsonp https://rubygems.org/gems/rack-jsonp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RUBY_PATCHES=( "${FILESDIR}/rack-jsonp-1.3.1-fix-escapes.patch" )

ruby_add_rdepend "dev-ruby/rack"

all_ruby_prepare() {
	sed -i -e "/require 'spec'/d" spec/spec_helper.rb || die
}
