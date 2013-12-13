# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

inherit ruby-fakegem

RUBY_FAKEGEM_EXTRADOC="README.textile History.txt"
RUBY_FAKEGEM_EXTRAINSTALL="features test"

DESCRIPTION="A simple, blog aware, static site generator"
HOMEPAGE="http://jekyllrb.com http://github.com/mojombo/jekyll"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/albino
	dev-ruby/classifier
	dev-ruby/directory_watcher
	dev-ruby/kramdown
	dev-ruby/liquid
	dev-ruby/maruku"
