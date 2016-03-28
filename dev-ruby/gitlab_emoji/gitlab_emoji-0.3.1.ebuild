# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG"

inherit ruby-fakegem

DESCRIPTION="GitLab emoji assets"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab_emoji https://rubygems.org/gems/gitlab_emoji"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gemojione-2.2.1
	<dev-ruby/gemojione-3"
