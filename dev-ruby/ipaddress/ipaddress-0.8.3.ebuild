# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Library to handle IP (IPv4 and IPv6) addresses in a modern and productive way"
HOMEPAGE="https://rubygems.org/gems/ipaddress https://github.com/bluemonk/ipaddress"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "dev-ruby/rake"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
