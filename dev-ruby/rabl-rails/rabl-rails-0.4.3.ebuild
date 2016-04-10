# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"

inherit ruby-fakegem

DESCRIPTION="Fast Rails 3+ templating system with JSON, XML and PList support"
HOMEPAGE="https://rubygems.org/gems/rabl-rails https://github.com/ccocchi/rabl-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/activesupport-3.1
	>=dev-ruby/railties-3.1
	>=dev-ruby/thread_safe-0.3.1
	<dev-ruby/thread_safe-0.4"

#ruby_add_bdepend "test? ( >=dev-ruby/actionpack-3.1
#	dev-ruby/plist 
#	dev-ruby/libxml 
#	dev-ruby/minitest )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" Rakefile || die
}
