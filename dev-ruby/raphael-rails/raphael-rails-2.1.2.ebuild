# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST=""

inherit ruby-fakegem

DESCRIPTION="Raphael JS as a Rubygem for use in the Rails asset pipeline"
HOMEPAGE="https://rubygems.org/gems/raphael-rails https://github.com/mockdeep/raphael-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
