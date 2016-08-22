# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_DOC_DIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"

inherit ruby-fakegem

DESCRIPTION="Rails variables in JS"
HOMEPAGE="https://github.com/gazay/gon https://rubygems.org/gems/gon"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.0
	dev-ruby/json
	dev-ruby/multi_json
	>=dev-ruby/request_store-1.0"
ruby_add_bdepend "test? ( dev-ruby/jbuilder
	>=dev-ruby/rabl-0.11.3
	dev-ruby/rabl-rails
	>=dev-ruby/railties-3.0 )"
