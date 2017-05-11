# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Makes your .PO files available to client side javascript as JSON"
HOMEPAGE="https://github.com/webhippie/gettext_i18n_rails_js https://rubygems.org/gems/gettext_i18n_rails_js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby-gettext-3.0.2
	>=dev-ruby/gettext_i18n_rails-0.7.1
	>=dev-ruby/po_to_json-1.0.0
	>=dev-ruby/rails-3.2.0"

all_ruby_prepare() {
	sed -i -e "/simplecov/,+21d" spec/spec_helper.rb || die
}
