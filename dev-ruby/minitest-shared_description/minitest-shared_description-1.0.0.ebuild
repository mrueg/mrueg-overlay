# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_EXTRADOC="README.rdoc CHANGELOG"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Adds support for shared specs and shared spec subclasses"
HOMEPAGE="https://rubygems.org/gems/minitest-shared_description http://github.com/jeremyevans/minitest-shared_description"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5"

each_ruby_test() {
	${RUBY} -Ilib spec/minitest-shared_description_spec.rb || die
}
