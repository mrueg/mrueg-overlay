# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST=""

inherit ruby-fakegem

DESCRIPTION="Packages Cal-HeatMap for Rails Asset Pipeline"
HOMEPAGE="https://rubygems.org/gems/cal-heatmap-rails https://github.com/pavolzbell/cal-heatmap-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
