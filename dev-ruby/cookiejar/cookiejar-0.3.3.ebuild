# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="yard"

RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="Allows for parsing and returning cookies in Ruby HTTP client code"
HOMEPAGE="http://github.com/dwaite/cookiejar http://alkaline-solutions.com https://rubygems.org/gems/cookiejar"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/rspec-collection_matchers-1.0
	<dev-ruby/rspec-collection_matchers-2 )"
