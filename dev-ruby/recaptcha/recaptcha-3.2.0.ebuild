# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Helpers for the reCAPTCHA API"
HOMEPAGE="http://github.com/ambethia/recaptcha https://rubygems.org/gems/recaptcha"
SRC_URI="https://github.com/ambethia/recaptcha/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "dev-ruby/rake
	test? ( >=dev-ruby/activesupport-4
	dev-ruby/i18n
	dev-ruby/maxitest
	dev-ruby/mocha
	dev-ruby/webmock )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e '/bump/d' Rakefile test/helper.rb || die
}
