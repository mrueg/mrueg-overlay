# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Proxy email (gmail) from IMAP to a delivery method"
HOMEPAGE="http://github.com/tpitale/mail_room https://rubygems.org/gems/mail_room"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/bourne
	dev-ruby/charlock_holmes
	dev-ruby/fakeredis
	dev-ruby/faraday
	dev-ruby/letter_opener
	dev-ruby/mail
	dev-ruby/mocha
	dev-ruby/pg
	dev-ruby/redis-namespace )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "/[Ss]imple[Cc]ov/d" spec/spec_helper.rb || die
}
