# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="ShamRack plumbs Net::HTTP directly into Rack, for quick and easy HTTP testing."
HOMEPAGE="http://github.com/mdub/sham_rack https://rubygems.org/gems/sham_rack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/rack"

ruby_add_bdepend "test? ( dev-ruby/rest-client
	dev-ruby/rack-test
	dev-ruby/sinatra
	dev-ruby/mechanize
	dev-ruby/patron )"

RESTRICT="test"
