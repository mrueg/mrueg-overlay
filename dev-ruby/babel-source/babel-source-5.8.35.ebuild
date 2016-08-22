# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Babel JS source"
HOMEPAGE="https://rubygems.org/gems/babel-source https://github.com/babel/ruby-babel-transpiler"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
