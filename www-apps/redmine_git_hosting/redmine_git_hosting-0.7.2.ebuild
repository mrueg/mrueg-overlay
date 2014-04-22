# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19"
inherit ruby-ng user

DESCRIPTION="A Redmine plugin which makes configuring your own Git hosting easy"
HOMEPAGE="https://github.com/jbox-web/redmine_git_hosting"
SRC_URI="https://github.com/jbox-web/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/lockfile
	dev-ruby/jbox-gitolite
	dev-ruby/github-markup
	dev-ruby/redcloth
	dev-ruby/org-ruby
	dev-ruby/creole
	dev-ruby/wikicloth
	dev-ruby/asciidoctor"

REDMINE_DIR="/var/lib/redmine"

pkg_setup() {
	enewgroup redmine
	enewuser redmine -1 -1 "${REDMINE_DIR}" redmine
}

all_ruby_install() {
	dodoc README.md
	rm README.md LICENSE
	dodir ${REDMINE_DIR}/plugins/${PN}
	insinto ${REDMINE_DIR}/plugins/${PN}
	doins -r .
	fowners -r redmine:redmine ${REDMINE_DIR}/plugins/${PN}
}
