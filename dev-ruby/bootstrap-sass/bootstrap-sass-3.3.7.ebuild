# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRAINSTALL="assets tasks"

inherit ruby-fakegem

DESCRIPTION="Sass-powered version of Bootstrap 3"
HOMEPAGE="https://github.com/twbs/bootstrap-sass https://rubygems.org/gems/bootstrap-sass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/autoprefixer-rails-5.2.1
	>=dev-ruby/sass-3.3.4"

RESTRICT="test" # requires dev-ruby/poltergeist
#ruby_add_bdepend ">=dev-ruby/actionpack-4.1.5
#	>=dev-ruby/activesupport-4.1.5
#	>=dev-ruby/capybara-2.5.0
#	>=dev-ruby/jquery-rails-3.1.0
#	>=dev-ruby/json-1.8.1
#	>=dev-ruby/minitest-5.8
#	<dev-ruby/minitest-6
#	dev-ruby/slim-rails
#	>=dev-ruby/sprockets-rails-2.1.3
#	dev-ruby/term-ansicolor
#	dev-ruby/uglifier"

#all_ruby_prepare() {
#	sed -i -e "/[Rr]eporters/d" test/test_helper.rb || die
#	sed -i -e "1s/^/require \'capybara\/dsl\'\n/" test/support/dummy_rails_integration.rb || die
#	sed -i -e "s/bundle exec //" test/sprockets_rails_test.rb test/compass_test.rb test/sass_test.rb || die
#	sed -i -e "/bundler/d" test/dummy_rails/config/application.rb test/dummy_rails/config/boot.rb || die
#	rm test/{compass,sass,node_mincer}_test.rb || die
#}
