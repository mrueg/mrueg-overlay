# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Tracking of retained objects in CRuby"
HOMEPAGE="https://rubygems.org/gems/allocations https://gitlab.com/gitlab-org/allocations"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/liballocations extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext/liballocations
	cp ext/liballocations/liballocations$(get_modname) lib/ || die
}
