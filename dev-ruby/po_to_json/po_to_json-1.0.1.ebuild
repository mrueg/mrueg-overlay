# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Convert gettext PO files to JSON objects"
HOMEPAGE="https://github.com/webhippie/po_to_json https://rubygems.org/gems/po_to_json"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.6.0"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+21d" spec/spec_helper.rb || die
}
