# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="Automatic strong parameter detection with Hashie and Forbidden Attributes"
HOMEPAGE="https://rubygems.org/gems/hashie-forbidden_attributes https://github.com/Maxim-Filimonov/hashie-forbidden_attributes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hashie-3.0"

RESTRICT="test"
