# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="This provides jQuery scrollTo for your Rails 3 application"
HOMEPAGE="https://rubygems.org/gems/jquery-scrollto-rails https://github.com/JohnColvin/jquery-scrollto-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/railties-5.0
	>dev-ruby/railties-3.1"
