# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="Improve rendering of HTML emails by making CSS inline and converting links"
HOMEPAGE="https://rubygems.org/gems/premailer http://premailer.dialect.ca/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/css_parser-1.3.7
	>=dev-ruby/htmlentities-4.0.0"
ruby_add_bdepend "test? ( >=dev-ruby/hpricot-0.8.3
	>=dev-ruby/nokogiri-1.4.4
	dev-ruby/webmock )
	doc? ( >=dev-ruby/redcarpet-3.0 )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "/Yard/,+2d" -e "/yard/d" rakefile.rb || die
}
