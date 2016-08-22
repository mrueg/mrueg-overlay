# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A cross-platform interface for gathering filesystem information"

HOMEPAGE="https://rubygems.org/gems/sys-filesystem https://github.com/djberg96/sys-filesystem"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/ffi"

ruby_add_bdepend "test? ( dev-ruby/rake
	>=dev-ruby/test-unit-2.5.0 )"
