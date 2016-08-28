# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST=""

inherit ruby-fakegem

DESCRIPTION="JSON matchmaking for all your API testing needs"
HOMEPAGE="https://rubygems.org/gems/json_expressions https://github.com/chancancode/json_expressions"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
