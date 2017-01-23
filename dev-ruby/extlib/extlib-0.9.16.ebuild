# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="Support library for Merb"
HOMEPAGE="https://rubygems.org/gems/extlib http://github.com/datamapper/extlib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e "s/spec/rspec/" spec/spec_helper.rb || die
	sed -i -e "/%s must not be blank\".t(:username)/ s/^/#/"\
		-e "s/Config::CONFIG/RbConfig::CONFIG/" spec/string_spec.rb || die
	sed -i -e "/Time.xmlschema(\"2008-03-28T17:54:20-05:00\")/ s/^/#/" spec/time_spec.rb || die
}
