# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Render QR codes with Rails 3"
HOMEPAGE="http://github.com/samvincent/rqrcode-rails3 https://rubygems.org/gems/rqrcode-rails3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rqrcode-0.4.2
	>=dev-ruby/actionpack-3.2"

RESTRICT="test" # no tests available
