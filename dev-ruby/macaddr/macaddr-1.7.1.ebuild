# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_EXTRADOC="README"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Cross platform mac address determination for ruby"
HOMEPAGE="https://github.com/ahoward/macaddr https://rubygems.org/gems/macaddr"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/systemu-2.6.2
	<dev-ruby/systemu-2.7"

ruby_add_bdepend "test? ( dev-ruby/test-unit
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e 's/Config/RbConfig/' Rakefile || die
}
