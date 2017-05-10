# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A TOML parser using Citrus parsing library"
HOMEPAGE="https://rubygems.org/gems/toml-rb http://github.com/emancu/toml-rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">dev-ruby/citrus-3.0
	<dev-ruby/citrus-4"
ruby_add_bdepend "test? ( dev-ruby/minitest )"
