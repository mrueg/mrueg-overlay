# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A gem that provides a client interface for the Sentry error logger"
HOMEPAGE="https://github.com/getsentry/raven-ruby https://rubygems.org/gems/sentry-raven"
SRC_URI="https://github.com/getsentry/raven-ruby/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RUBY_S="raven-ruby-${PV}"

ruby_add_rdepend ">=dev-ruby/faraday-0.7.6"
ruby_add_bdepend "test? ( >=dev-ruby/mime-types-1.16
	<dev-ruby/mime-types-2
	dev-ruby/rest-client
	dev-ruby/rspec-rails:3
	dev-ruby/test-unit:2
	dev-ruby/timecop )"

all_ruby_prepare() {
	# Relies on bundler and rake
	rm spec/raven/integrations/rake_spec.rb || die
}
