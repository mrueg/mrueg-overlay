# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="jQuery plugin for drop-in fix binded events problem caused by Turbolinks"
HOMEPAGE="https://rubygems.org/gems/jquery-turbolinks https://github.com/kossnocorp/jquery.turbolinks"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/railties-3.1.0
	dev-ruby/turbolinks"

RESTRICT="test"
