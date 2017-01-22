# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="This is the official Ruby library for InfluxDB"
HOMEPAGE="https://rubygems.org/gems/influxdb https://github.com/influxdb/influxdb-ruby http://influxdb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/json"

ruby_add_bdepend "test? ( >=dev-ruby/webmock-2.1.0 )"
