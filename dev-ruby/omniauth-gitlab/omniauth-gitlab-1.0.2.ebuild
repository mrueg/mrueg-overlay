# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="This is the strategy for authenticating to your GitLab service"
HOMEPAGE="https://rubygems.org/gems/omniauth-gitlab https://github.com/linchus/omniauth-gitlab"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/omniauth-1.0
	<dev-ruby/omniauth-2
	>=dev-ruby/omniauth-oauth2-1.0
	<dev-ruby/omniauth-oauth2-2"
ruby_add_bdepend "dev-ruby/rack-test
	>=dev-ruby/rspec-its-1.0
	<dev-ruby/rspec-its-2
	dev-ruby/webmock"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
}
