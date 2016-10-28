# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="OpenStack fog provider gem"
HOMEPAGE="https://github.com/fog/fog-openstack https://rubygems.org/gems/fog-openstack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/fog-core-1.40
	>=dev-ruby/fog-json-1.0
	>=dev-ruby/ipaddress-0.8"
