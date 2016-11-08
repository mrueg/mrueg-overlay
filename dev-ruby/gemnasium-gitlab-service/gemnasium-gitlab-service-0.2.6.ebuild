# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Add Gemnasium support to Gitlab as a Project Service"
HOMEPAGE="https://rubygems.org/gems/gemnasium-gitlab-service https://github.com/gemnasium/gemnasium-gitlab-service"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rugged-0.21
	<dev-ruby/rugged-1"
ruby_add_bdepend "test? ( >=dev-ruby/webmock-1.17
	<dev-ruby/webmock-2 )"

all_ruby_prepare() {
	sed -i -e "1s/^/require \'base64\'\n/" lib/gemnasium/gitlab_service/client.rb || die
}
