# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Strategy to restrict number of workers to run specified queues simultaneously"
HOMEPAGE="https://rubygems.org/gems/sidekiq-limit_fetch https://github.com/brainopia/sidekiq-limit_fetch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sidekiq-4"

RESTRICT="test"
