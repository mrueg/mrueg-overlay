# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="Quickly write expressive and robust acceptance tests for a Ruby web applications"
HOMEPAGE="https://rubygems.org/gems/webrat http://github.com/brynary/webrat"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.2.0
	>=dev-ruby/rack-1.0
	>=dev-ruby/rack-test-0.5.3"

RESTRICT="test"
