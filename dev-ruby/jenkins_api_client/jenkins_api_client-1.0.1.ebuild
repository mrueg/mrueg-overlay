# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="Simple and easy-to-use Jenkins Api Client"
HOMEPAGE="https://github.com/arangamani/jenkins_api_client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
	dev-ruby/json
	dev-ruby/mixlib-shellout
	>=dev-ruby/nokogiri-1.6
	dev-ruby/terminal-table
	>=dev-ruby/thor-0.16.0"

all_ruby_prepare() {
	# Only run unit_tests
	rm -r spec/func_tests || die
}
