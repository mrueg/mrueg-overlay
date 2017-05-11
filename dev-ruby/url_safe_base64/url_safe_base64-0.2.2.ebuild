# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Convert strings to/from a modified base64 that contains only url-safe characters"
HOMEPAGE="http://github.com/joenoon/url_safe_base64 https://rubygems.org/gems/url_safe_base64"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
