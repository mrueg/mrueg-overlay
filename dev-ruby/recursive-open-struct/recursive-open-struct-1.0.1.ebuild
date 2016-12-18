# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="A subclass of OpenStruct that allows nested hashes to be treated recursively"
HOMEPAGE="http://github.com/aetherknight/recursive-open-struct https://rubygems.org/gems/recursive-open-struct"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e "/pry/d" spec/spec_helper.rb || die
}
