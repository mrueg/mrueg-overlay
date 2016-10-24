# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="EXtended http(s) CONnections"
HOMEPAGE="https://rubygems.org/gems/excon https://github.com/excon/excon"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"
#ruby_add_bdepend "dev-ruby/activesupport
#	dev-ruby/delorean
#	>=dev-ruby/eventmachine-1.0.4
#	>=dev-ruby/json-1.8.2
#	dev-ruby/open4
#	dev-ruby/rake
#	dev-ruby/rdoc
#	>=dev-ruby/rspec-3.5.0
#	dev-ruby/shindo
#	dev-ruby/sinatra
#	dev-ruby/sinatra-contrib"
