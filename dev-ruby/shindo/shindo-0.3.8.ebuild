# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Simple depth first ruby testing, watch and learn"
HOMEPAGE="http://github.com/geemus/shindo https://rubygems.org/gems/shindo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/formatador-0.1.1"

each_ruby_test() {
	for i in tests/*rb; do
		${RUBY} -I lib -S bin/shindo $i || die
	done
}
