# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

inherit ruby-fakegem

RUBY_FAKEGEM_TASK_DOC=""

DESCRIPTION="Gem to help with parsing numbers in natural language from strings (ex forty two)"
HOMEPAGE="http://github.com/jduff/numerizer https://rubygems.org/gems/numerizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
