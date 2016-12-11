# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="History.txt README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Provides a single point of entry for using basic features of ruby ORMs"
HOMEPAGE="http://github.com/ianwhite/orm_adapter https://rubygems.org/gems/orm_adapter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# datamapper not packaged
RESTRICT="test"

#ruby_add_bdepend ">=dev-ruby/activerecord-3.2.15
#	>=dev-ruby/bson_ext-1.3.0
#	>=dev-ruby/bundler-1.0.0
#	>=dev-ruby/datamapper-1.0
#	>=dev-ruby/dm-active_model-1.0
#	>=dev-ruby/dm-sqlite-adapter-1.0
#	>=dev-ruby/git-1.2.5
#	>=dev-ruby/mongoid-2.8.0
#	<dev-ruby/mongoid-2.9
#	>=dev-ruby/mongo_mapper-0.11.0
#	<dev-ruby/mongo_mapper-0.12
#	>=dev-ruby/rake-0.8.7
#	>=dev-ruby/sqlite3-1.3.2"
