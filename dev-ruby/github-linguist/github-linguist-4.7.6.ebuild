# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_RECIPE_DOC=""
# File collision with qt-linguist
RUBY_FAKEGEM_BINWRAP="git-linguist"

inherit ruby-fakegem

DESCRIPTION="Detects blob languages, highlights code and generates language breakdown graphs"
HOMEPAGE="https://github.com/github/linguist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Gemfile does not include tests
# Release tarball does not include grammar files
RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/charlock_holmes-0.7.3
	>=dev-ruby/escape_utils-1.1.0
	>=dev-ruby/mime-types-1.19
	>=dev-ruby/rugged-0.23.0b"

all_ruby_prepare() {
	sed -i -e "s/1.1.0/'1.1'/" ../metadata || die
}
