# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="JS Library for keyboard shortcuts using the Rails asset pipeline"
HOMEPAGE="https://github.com/kugaevsky/mousetrap-rails https://rubygems.org/gems/mousetrap-rails"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"
