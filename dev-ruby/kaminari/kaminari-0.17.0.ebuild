# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_EXTRAINSTALL="app config"

inherit ruby-fakegem

DESCRIPTION="A pagination engine plugin for Rails 3+ and other modern frameworks"
HOMEPAGE="https://github.com/amatsuda/kaminari"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0:*
	>=dev-ruby/actionpack-3.0.0:*"

#ruby_add_bdepend "test? ( dev-ruby/tzinfo
#	dev-ruby/rr
#	dev-ruby/rspec-rails:3
#	dev-ruby/capybara
#	dev-ruby/database_cleaner )"

RESTRICT="test"
