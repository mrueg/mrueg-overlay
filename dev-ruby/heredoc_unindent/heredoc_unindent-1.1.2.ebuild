# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_EXTRADOC="README.rdoc History.rdoc Wishlist.rdoc"
inherit ruby-fakegem

DESCRIPTION="Removes leading whitespace from Ruby heredocs"
HOMEPAGE="https://github.com/adrianomitre/heredoc_unindent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( >=dev-ruby/hoe-2.8.0 )"
