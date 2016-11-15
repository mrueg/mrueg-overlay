# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A Ruby client for Artifactory"
HOMEPAGE="https://github.com/opscode/artifactory-client https://rubygems.org/gems/artifactory"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/rspec-mocks-3.4.0
	>=dev-ruby/webmock-1.17:0
	>=dev-ruby/sinatra-1.4 )"

RESTRICT="test"

all_ruby_prepare() {
	sed -i -e "/bundler/d" spec/spec_helper.rb || die
}
