# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit multilib ruby-fakegem

DESCRIPTION="Parse YAML safely, without that pesky arbitrary object deserialization vulnerability"
HOMEPAGE="https://dtao.github.com/safe_yaml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/hashie
	dev-ruby/heredoc_unindent )"
