# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Extraction of the JSON parsing tools shared between fog providers"
HOMEPAGE="https://rubygems.org/gems/fog-json http://github.com/fog/fog-json"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-core-1.0
	<dev-ruby/fog-core-2
	>=dev-ruby/multi_json-1.10
	<dev-ruby/multi_json-2"

ruby_add_bdepend "test? ( dev-ruby/minitest )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
