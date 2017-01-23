# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A client for Kubernetes REST api"
HOMEPAGE="https://rubygems.org/gems/kubeclient https://github.com/abonas/kubeclient"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "~dev-ruby/http-0.9.8
	>=dev-ruby/recursive-open-struct-1.0.0
	<dev-ruby/recursive-open-struct-1.1
	dev-ruby/rest-client"

ruby_add_bdepend "test? (
	dev-ruby/minitest
	>=dev-ruby/rake-10.0
	dev-ruby/vcr
	>=dev-ruby/webmock-1.24.2
	<dev-ruby/webmock-1.25 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "s/, :rubocop//" -e "/[Rr]ubo[Cc]op/d" Rakefile || die
}
