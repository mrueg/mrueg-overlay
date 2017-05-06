# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Upload files in applications, map them to ORMs, store them on backends"
HOMEPAGE="https://rubygems.org/gems/carrierwave https://github.com/carrierwaveuploader/carrierwave"
SRC_URI="https://github.com/carrierwaveuploader/carrierwave/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.0.0
	>=dev-ruby/activesupport-4.0.0
	>=dev-ruby/mime-types-1.16"
#ruby_add_bdepend ">=dev-ruby/cucumber-1.3.2
#	<dev-ruby/cucumber-1.4
#	>=dev-ruby/fog-1.3.1
#	dev-ruby/generator_spec
#	>=dev-ruby/mini_magick-3.6.0
#	dev-ruby/mysql2
#	>=dev-ruby/nokogiri-1.5.10
#	<dev-ruby/nokogiri-1.6
#	>=dev-ruby/rails-3.2.0
#	dev-ruby/rmagick
#	dev-ruby/sham_rack
#	=dev-ruby/timecop-0.6.1"

#all_ruby_prepare() {
#	sed -i -e "/bundler/d" spec/spec_helper.rb || die
#}

RESTRICT="test"
