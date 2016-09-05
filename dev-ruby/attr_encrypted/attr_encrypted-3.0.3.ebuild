# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Generates attr_accessors that encrypt and decrypt attributes transparently"
HOMEPAGE="http://github.com/attr-encrypted/attr_encrypted https://rubygems.org/gems/attr_encrypted"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/encryptor-3.0.0
	<dev-ruby/encryptor-3.1"

#ruby_add_bdepend ">=dev-ruby/actionpack-2.0.0
#	>=dev-ruby/activerecord-2.0.0
#	dev-ruby/datamapper
#	dev-ruby/dm-sqlite-adapter
#	dev-ruby/minitest
#	dev-ruby/rake
#	dev-ruby/sequel
#	dev-ruby/sqlite3"

RESTRICT="test" #unpackaged dependencies
