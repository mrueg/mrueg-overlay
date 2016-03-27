# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG README.rdoc"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

# uuid uses this to determine its version number.
RUBY_FAKEGEM_EXTRAINSTALL="uuid.gemspec"

inherit ruby-fakegem

DESCRIPTION="UUID generator for producing universally unique identifiers based on RFC 4122"
HOMEPAGE="http://github.com/assaf/uuid https://rubygems.org/gems/uuid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/macaddr-1.0
	<dev-ruby/macaddr-2"

ruby_add_bdepend "test? ( dev-ruby/mocha:0.14
	dev-ruby/test-unit
	dev-ruby/rake )"

all_ruby_prepare() {
	# Only works with older mocha versions.
	sed -e '2igem "mocha", "~>0.14.0"' -i test/test-uuid.rb || die
}
