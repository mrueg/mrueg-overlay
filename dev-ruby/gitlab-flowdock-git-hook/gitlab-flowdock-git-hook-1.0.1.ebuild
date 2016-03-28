# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Git Post-Receive hook for Flowdock"
HOMEPAGE="https://rubygems.org/gems/gitlab-flowdock-git-hook http://github.com/bladealslayer/flowdock-git-hook"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/flowdock-0.7
	<dev-ruby/flowdock-1
	>=dev-ruby/gitlab-grit-2.4.1
	dev-ruby/multi_json"
#ruby_add_bdepend "test? ( >=dev-ruby/webmock-1.6.4 )"
