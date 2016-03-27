# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Provides the generator settings required for Rails 3 and 4 to use Slim"
HOMEPAGE="https://github.com/slim-template/slim-rails https://rubygems.org/gems/slim-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/actionmailer-5.0
	>=dev-ruby/actionmailer-3.1
	<dev-ruby/actionpack-5.0
	>=dev-ruby/actionpack-3.1
	<dev-ruby/activesupport-5.0
	>=dev-ruby/activesupport-3.1
	<dev-ruby/railties-5.0
	>=dev-ruby/railties-3.1
	>=dev-ruby/slim-3.0
	<dev-ruby/slim-4"

ruby_add_bdepend "test? (
	>=dev-ruby/rake-10.4
	>=dev-ruby/redcarpet-3.2
	<dev-ruby/redcarpet-4 )"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" Rakefile || die
}
