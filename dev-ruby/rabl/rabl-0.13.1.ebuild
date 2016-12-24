# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md CONTRIBUTING.md README.md"

inherit ruby-fakegem

DESCRIPTION="General ruby templating with json, bson, xml and msgpack support"
HOMEPAGE="https://rubygems.org/gems/rabl https://github.com/nesquena/rabl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-2.3.14"

RESTRICT="test"

#ruby_add_bdepend ">=dev-ruby/bson-1.7.0
#	<dev-ruby/bson-1.8
#	>=dev-ruby/msgpack-0.4.5
#	<dev-ruby/msgpack-0.5
#	dev-ruby/oj
#	dev-ruby/plist
#	dev-ruby/rake
#	>=dev-ruby/riot-0.12.3
#	<dev-ruby/riot-0.13
#	>=dev-ruby/rr-1.0.2
#	<dev-ruby/rr-1.1
#	dev-ruby/tilt"
