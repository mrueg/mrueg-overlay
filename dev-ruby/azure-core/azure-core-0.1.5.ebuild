# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""
inherit ruby-fakegem

DESCRIPTION="Microsoft Azure Client Core Library for Ruby SDK"
HOMEPAGE="https://rubygems.org/gems/azure-core http://github.com/Azure/azure-ruby-asm-core"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/faraday-0.9
	<dev-ruby/faraday-1
	>=dev-ruby/faraday_middleware-0.10
	<dev-ruby/faraday_middleware-1
	>=dev-ruby/nokogiri-1.6
	<dev-ruby/nokogiri-2"
