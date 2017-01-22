# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Turbolinks makes following links in your web application faster (use with Rails Asset Pipeline)"
HOMEPAGE="https://gitlab.com/jamedjo/gitlab-turbolinks-classic/ https://rubygems.org/gems/gitlab-turbolinks-classic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/coffee-rails"
