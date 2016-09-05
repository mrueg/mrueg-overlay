# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
inherit ruby-fakegem

DESCRIPTION="Extraction of the XML parsing tools shared between fog providers"
HOMEPAGE="https://github.com/fog/fog-xml https://rubygems.org/gems/fog-xml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/fog-core
	>=dev-ruby/nokogiri-1.5.11
	<dev-ruby/nokogiri-2"

ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "7,29d" -e "/turn/d" spec/minitest_helper.rb || die
}
