# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

inherit ruby-fakegem

RUBY_FAKEGEM_EXTRADOC="README.textile History.txt"
RUBY_FAKEGEM_EXTRAINSTALL="features"

DESCRIPTION="A simple, blog aware, static site generator"
HOMEPAGE="http://jekyllrb.com http://github.com/mojombo/jekyll"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend "dev-ruby/classifier
	dev-ruby/colorator
	dev-ruby/commander
	dev-ruby/directory_watcher
	dev-ruby/kramdown
	dev-ruby/liquid
	dev-ruby/maruku
	dev-ruby/pygments_rb
	dev-ruby/redcarpet
	dev-ruby/safe_yaml
	test? (	dev-ruby/launchy
			dev-ruby/rdiscount
			dev-ruby/redcloth
			dev-ruby/rr
			dev-ruby/shoulda
			dev-ruby/simplecov )"

RUBY_PATCHES=("${FILESDIR}"/${P}-fix-tests.patch)
