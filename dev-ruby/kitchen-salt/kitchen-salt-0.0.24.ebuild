# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="salt provisioner for test-kitchen so that you can test all the things"
HOMEPAGE="https://github.com//kitchen-salt https://rubygems.org/gems/kitchen-salt"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/test-kitchen-1.4
	<dev-ruby/test-kitchen-2"
