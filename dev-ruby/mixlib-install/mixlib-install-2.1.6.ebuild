# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A mixin to help with omnitruck installs"
HOMEPAGE="https://chef.io https://rubygems.org/gems/mixlib-install"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/artifactory
	dev-ruby/mixlib-shellout
	dev-ruby/mixlib-versioning
	dev-ruby/thor"
