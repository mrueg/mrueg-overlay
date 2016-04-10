# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md CHANGELOG.md"

inherit ruby-fakegem

DESCRIPTION="Send Devise's emails in background"
HOMEPAGE="https://github.com/mhfs/devise-async/ https://github.com/mhfs/devise-async https://rubygems.org/gems/devise-async"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="test"

ruby_add_rdepend ">=dev-ruby/devise-3.2
	<dev-ruby/devise-4"
#ruby_add_bdepend ">=dev-ruby/actionmailer-3.2
#	>=dev-ruby/actionpack-3.2
#	>=dev-ruby/activerecord-3.2
#	>=dev-ruby/backburner-0.4
#	<dev-ruby/backburner-1
#	>=dev-ruby/delayed_job_active_record-0.3
#	<dev-ruby/delayed_job_active_record-1
#	>=dev-ruby/minitest-3.0
#	<dev-ruby/minitest-4
#	>=dev-ruby/mocha-0.11
#	<dev-ruby/mocha-1
#	>=dev-ruby/que-0.8
#	<dev-ruby/que-1
#	>=dev-ruby/queue_classic-2.0
#	<dev-ruby/queue_classic-3
#	>=dev-ruby/resque-1.20
#	<dev-ruby/resque-2
#	>=dev-ruby/sidekiq-2.17
#	<dev-ruby/sidekiq-3
#	>=dev-ruby/sqlite3-1.3
#	<dev-ruby/sqlite3-2
#	>=dev-ruby/sucker_punch-1.0.5
#	<dev-ruby/sucker_punch-1.1
#	>=dev-ruby/torquebox-no-op-2.3
#	<dev-ruby/torquebox-no-op-3"
