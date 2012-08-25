# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19 ree18 jruby"

RUBY_FAKEGEM_EXTRADOC="README.txt History.txt"

inherit ruby-fakegem

DESCRIPTION="Monitors directories for changes"
HOMEPAGE="http://gemcutter.org/gems/directory_watcher https://github.com/TwP/directory_watcher/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
