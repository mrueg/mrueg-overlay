# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Parse CSS and add vendor prefixes to CSS rules"
HOMEPAGE="https://github.com/ai/autoprefixer-rails https://rubygems.org/gems/autoprefixer-rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/execjs"
ruby_add_bdepend "dev-ruby/rails
	dev-ruby/rake
	dev-ruby/rspec-rails"
	# dev-ruby/compass (currently test is removed)
all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "/BUNDLE/d" spec/app/config/boot.rb || die
	sed -i -e "/Bundler/,+3d" spec/app/config/application.rb || die
	rm spec/rails_spec.rb spec/compass_spec.rb || die
}
