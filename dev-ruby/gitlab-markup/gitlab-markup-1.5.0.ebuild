# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_RECIPE_TEST="rake"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="HISTORY.md README.md"

inherit ruby-fakegem

DESCRIPTION="Used on GitLab when rendering README or any other rich text file"
HOMEPAGE="https://gitlab.com/gitlab-org/markup"
#SRC_URI="https://github.com/github/markup/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND+=" dev-python/docutils
	virtual/perl-Pod-Simple"

ruby_add_rdepend "
	dev-ruby/redcarpet
	dev-ruby/rdiscount
	dev-ruby/maruku
	dev-ruby/kramdown
	dev-ruby/posix-spawn
	dev-ruby/redcloth
	dev-ruby/org-ruby
	dev-ruby/rinku
	dev-ruby/creole
	dev-ruby/wikicloth
	>=dev-ruby/asciidoctor-1.5.2"

each_ruby_test() {
	${RUBY} -Ilib test/markup_test.rb || die
}
