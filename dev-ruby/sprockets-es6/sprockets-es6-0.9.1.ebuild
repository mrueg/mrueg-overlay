# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Sprockets transformer that converts ES6 code into vanilla ES5 with Babel JS"
HOMEPAGE="https://github.com/TannerRogalsky/sprockets-es6 https://rubygems.org/gems/sprockets-es6"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/babel-source-5.8.11
	dev-ruby/babel-transpiler
	>=dev-ruby/sprockets-3.0.0"

#ruby_add_bdepend "dev-ruby/minitest
#	dev-ruby/rake"
