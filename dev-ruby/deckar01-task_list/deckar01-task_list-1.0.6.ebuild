# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="GitHub-flavored-Markdown TaskList components"
HOMEPAGE="https://rubygems.org/gems/deckar01-task_list https://github.com/deckar01/task_list"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/html-pipeline"
ruby_add_bdepend "test? ( dev-ruby/coffee-script
	dev-ruby/github-markdown
	>=dev-ruby/minitest-5.3.2
	dev-ruby/rack
	dev-ruby/rake
	dev-ruby/sprockets )"

all_ruby_prepare() {
	sed -i -e "/bundler/d" Rakefile || die
}
