# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"

inherit ruby-fakegem

DESCRIPTION="The Database Toolkit for Ruby"
HOMEPAGE="https://rubygems.org/gems/sequel http://sequel.jeremyevans.net"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? (
	>=dev-ruby/minitest-5.7.0:5
	dev-ruby/minitest-hooks
	dev-ruby/minitest-shared_description
	dev-ruby/nokogiri )"
