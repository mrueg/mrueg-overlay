# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Adapter for Gollum to use Grit at the backend"
HOMEPAGE="https://rubygems.org/gems/gollum-grit_adapter https://github.com/gollum/grit_adapter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RUBY_S=grit_adapter-${PV}

ruby_add_rdepend ">=dev-ruby/gitlab-grit-2.7.1
	<dev-ruby/gitlab-grit-3"
