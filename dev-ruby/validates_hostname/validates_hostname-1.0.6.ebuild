# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Extension to ActiveRecord::Base for validating hostnames"
HOMEPAGE="https://rubygems.org/gems/validates_hostname https://github.com/KimNorgaard/validates_hostname"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.0
	>=dev-ruby/activesupport-3.0"

RESTRICT="test"
