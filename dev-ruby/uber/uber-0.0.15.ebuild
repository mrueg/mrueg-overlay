# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A gem-authoring framework"
HOMEPAGE="https://rubygems.org/gems/uber https://github.com/apotonick/uber"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.0
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
