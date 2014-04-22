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
	dodir "${REDMINE_DIR}"/plugins/${PN}
	insinto "${REDMINE_DIR}"/plugins/${PN}
	doins -r .
	fowners -R redmine:redmine "${REDMINE_DIR}"/plugins/${PN}
}

pkg_postinst() {
	einfo
	elog "Please run emerge --config ${PF}"
	elog "Further information:"
	elog "https://github.com/jbox-web/redmine_git_hosting/wiki/Step-by-step-installation-instructions"
	einfo
}

pkg_config() {
	local RAILS_ENV=${RAILS_ENV:-production}
	if [ ! -L /usr/bin/ruby ]; then
		eerror "/usr/bin/ruby is not a valid symlink to any ruby implementation."
		eerror "Please update it via `eselect ruby`"
		die
	fi
	local RUBY=${RUBY:-ruby}
	einfo "Upgrading the plugin migrations."
	RAILS_ENV="${RAILS_ENV}" ${RUBY} -S rake redmine:plugins:migrate || die
	if [ ! -e "${REDMINE_DIR}"/plugins/redmine_git_hosting/ssh_keys/redmine_gitolite_admin_id_rsa ]; then
		einfo "Generating SSH-Keypair for Redmine user"
		ssh-keygen -N '' -f "${REDMINE_DIR}"/plugins/redmine_git_hosting/ssh_keys/redmine_gitolite_admin_id_rsa || die
		fowners redmine:redmine "${REDMINE_DIR}"/plugins/redmine_git_hosting/ssh_keys/redmine_gitolite_admin_ida_rsa{,.pub}
	fi
}
