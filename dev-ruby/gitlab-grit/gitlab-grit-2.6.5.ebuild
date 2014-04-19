# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19"
RUBY_FAKEGEM_EXTRADOC="README.md"

inherit eutils ruby-fakegem

DESCRIPTION="Git Library for Ruby. Gitlab fork"
HOMEPAGE="https://github.com/gitlabhq/grit"
SRC_URI="https://github.com/gitlabhq/grit/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=" dev-vcs/git"

RUBY_S="grit-${PV}"

ruby_add_rdepend "dev-ruby/charlock_holmes
	dev-ruby/diff-lcs
	dev-ruby/mime-types
	dev-ruby/posix-spawn"

ruby_add_bdepend "test? (
	dev-ruby/mocha
	dev-ruby/pry )"
