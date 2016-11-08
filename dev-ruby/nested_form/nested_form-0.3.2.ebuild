# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRAINSTALL="vendor"

inherit ruby-fakegem

DESCRIPTION="Rails gem for conveniently manage multiple nested models in a single form"
HOMEPAGE="https://github.com/ryanb/nested_form"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

#ruby_add_bdepend "test? ( dev-ruby/rspec-rails:2
#	dev-ruby/capybara )"

RESTRICT="test"
