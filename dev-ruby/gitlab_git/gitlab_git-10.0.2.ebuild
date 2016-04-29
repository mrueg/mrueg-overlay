# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="GitLab wrapper around git objects"
HOMEPAGE="https://rubygems.org/gems/gitlab_git https://gitlab.com/gitlab-org/gitlab_git"
SRC_URI="https://gitlab.com/gitlab-org/gitlab_git/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

RUBY_S="gitlab_git-*"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.0
	<dev-ruby/activesupport-5
	>=dev-ruby/charlock_holmes-0.7.3
	<dev-ruby/charlock_holmes-0.8
	>=dev-ruby/github-linguist-4.7.0
	>=dev-ruby/rugged-0.24.0
	<dev-ruby/rugged-0.25"
ruby_add_bdepend "test? ( >=dev-ruby/listen-3.0.6
	dev-ruby/rspec-mocks:3
	dev-ruby/rspec-its
	dev-ruby/webmock
	)"

all_ruby_prepare() {
	sed -i -e "/[Ss]imple[Cc]ov/d" -e '/pry/d' spec/spec_helper.rb || die
	sed -i -e "1irequire \'pathname\'\n" lib/gitlab_git/path_helper.rb || die
	sed -i -e "1irequire \'forwardable\'\n" -e "1irequire \'time\'\n" lib/gitlab_git/repository.rb || die
}
