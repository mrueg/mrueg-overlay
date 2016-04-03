# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md ChangeLog"

inherit ruby-fakegem

DESCRIPTION="Kill unicorn workers by memory and request counts"
HOMEPAGE="https://github.com/kzk/unicorn-worker-killer https://rubygems.org/gems/unicorn-worker-killer"

LICENSE="GPL-2+ Ruby"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/get_process_mem
	<www-servers/unicorn-6
	>=www-servers/unicorn-4"

RESTRICT="test"
