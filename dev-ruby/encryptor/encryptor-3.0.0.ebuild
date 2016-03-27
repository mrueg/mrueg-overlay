# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A simple wrapper for the ruby OpenSSL library to encrypt and decrypt strings"
HOMEPAGE="http://github.com/attr-encrypted/encryptor https://rubygems.org/gems/encryptor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=" dev-libs/openssl:0"

ruby_add_bdepend "test? ( dev-ruby/minitest
	dev-ruby/rake )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
	sed -i -e "/simplecov/,+15d" test/test_helper.rb || die
	sed -i -e "1s/^/require \'securerandom\'\n/" test/test_helper.rb || die
}
