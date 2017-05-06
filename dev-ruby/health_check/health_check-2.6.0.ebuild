# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Simple health check of Rails app for uptime monitoring"
HOMEPAGE="https://github.com/ianheggie/health_check https://rubygems.org/gems/health_check"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0"

ruby_add_bdepend "test? ( >=dev-ruby/rake-0.8.3
	>=dev-ruby/shoulda-2.11.0
	<dev-ruby/shoulda-2.12 )
	doc? ( dev-ruby/rdoc )"

RESTRICT="test"

all_ruby_prepare() {
	sed -i -e "/bundler/d" -e "s/HealthCheck::VERSION/'${PV}'/" Rakefile || die
}
