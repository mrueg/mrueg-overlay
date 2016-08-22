# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A bridge to the JS Babel transpiler"
HOMEPAGE="https://github.com/babel/ruby-babel-transpiler https://rubygems.org/gems/babel-transpiler"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend "<dev-ruby/babel-source-6
	>=dev-ruby/babel-source-4.0
	>=dev-ruby/execjs-2.0
	<dev-ruby/execjs-3"

#ruby_add_bdepend "test? ( >=dev-ruby/minitest-5.5
#	<dev-ruby/minitest-6 )"
