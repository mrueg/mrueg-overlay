# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc Todo.rdoc"

inherit ruby-fakegem

DESCRIPTION="Simple, feature rich ascii table generation library"
HOMEPAGE="https://github.com/visionmedia/terminal-table"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/term-ansicolor )"

all_ruby_prepare() {
	# See https://github.com/visionmedia/terminal-table/issues/33
	sed -i -e "/should account for the colspan when selecting columns/,+6d"\
		-e "/should only increase column size for multi-column if it is unavoidable/,+9d" spec/table_spec.rb || die
}
