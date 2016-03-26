# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Configuration-free premailer for Rails"
HOMEPAGE="https://github.com/fphilipe/premailer-rails https://rubygems.org/gems/premailer-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "<dev-ruby/actionmailer-5
	>=dev-ruby/actionmailer-3
	>=dev-ruby/premailer-1.7.9
	<dev-ruby/premailer-2"
ruby_add_bdepend "test? ( dev-ruby/hpricot
	dev-ruby/nokogiri )"

all_ruby_prepare() {
	sed -i -e "/RUBY_ENGINE/,+12d" spec/spec_helper.rb || die
}
