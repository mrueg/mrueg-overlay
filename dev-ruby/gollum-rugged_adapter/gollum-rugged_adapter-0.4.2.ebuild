# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_GEMSPEC="rugged_adapter.gemspec"

inherit ruby-fakegem

DESCRIPTION="Adapter for Gollum to use Rugged (libgit2) at the backend"
HOMEPAGE="https://rubygems.org/gems/gollum-rugged_adapter https://github.com/gollum/rugged_adapter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/mime-types-1.15
	>=dev-ruby/rugged-0.24.0
	<dev-ruby/rugged-0.25"
