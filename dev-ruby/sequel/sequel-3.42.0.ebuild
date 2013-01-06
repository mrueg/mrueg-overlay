# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby18 ruby19"
inherit ruby-fakegem

DESCRIPTION="The Database Toolkit for Ruby"
HOMEPAGE="http://sequel.rubyforge.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rake
		dev-ruby/rspec )"

all_ruby_install() {
	dodoc -r doc README.rdoc CHANGELOG
}

each_ruby_test() {
	${RUBY} -S rake spec
}
