# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Allows you to parse, compare and manipulate version strings in multiple formats."
HOMEPAGE="https://github.com/chef/mixlib-versioning https://github.com/opscode/mixlib-versioning https://rubygems.org/gems/mixlib-versioning"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
