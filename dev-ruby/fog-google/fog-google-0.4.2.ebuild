# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A module for fog to use the Google Cloud Platform"
HOMEPAGE="https://github.com/fog/fog-google https://rubygems.org/gems/fog-google"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/fog-core
	dev-ruby/fog-json
	dev-ruby/fog-xml"

#ruby_add_bdepend "test? (
#	>=dev-ruby/google-api-client-0.8.7
#	<dev-ruby/google-api-client-0.9
#	dev-ruby/mime-types
#	dev-ruby/minitest
#	dev-ruby/shindo
#	dev-ruby/vcr
#	dev-ruby/webmock )"

RESTRICT="test"

each_ruby_test() {
	${RUBY} -S shindont || die
}
