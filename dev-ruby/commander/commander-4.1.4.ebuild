# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="doc"

inherit ruby-fakegem

DESCRIPTION="The complete solution for Ruby command-line executables"
HOMEPAGE="http://visionmedia.github.com/commander/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/highline-1.6.11"
ruby_add_bdepend "test? ( >=dev-ruby/rspec-2
		dev-ruby/rake
		dev-ruby/simplecov )"
