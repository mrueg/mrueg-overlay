# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby20"
inherit ruby-ng user

DESCRIPTION="A Redmine plugin which allows to follow Scrum methodology"
HOMEPAGE="https://redmine.ociotec.com/projects/redmine-plugin-scrum"
SRC_URI="http://redmine.ociotec.com/attachments/download/335/scrum%20v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-ND-4.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RUBY_S="scrum v${PV}"

ruby_add_rdepend ">=www-apps/redmine-3"

REDMINE_DIR="/var/lib/redmine"

pkg_setup() {
	enewgroup redmine
	enewuser redmine -1 -1 "${REDMINE_DIR}" redmine
}

all_ruby_install() {
	dodoc README.rdoc
	rm README.rdoc license.txt || die
	dodir "${REDMINE_DIR}"/plugins/scrum
	insinto "${REDMINE_DIR}"/plugins/scrum
	doins -r .
	fowners -R redmine:redmine "${REDMINE_DIR}"/plugins/scrum
}

pkg_postinst() {
	einfo
	elog "Please run emerge --config =${PF}"
	elog "Further information:"
	elog "https://redmine.ociotec.com/projects/redmine-plugin-scrum"
	einfo
}

pkg_config() {
	local RAILS_ENV=${RAILS_ENV:-production}
	if [ ! -L /usr/bin/ruby ]; then
		eerror "/usr/bin/ruby is not a valid symlink to any ruby implementation."
		eerror "Please update it via `eselect ruby`"
		die
	fi
	if [[ $RUBY_TARGETS != *$( eselect ruby show | awk 'NR==2' | tr  -d ' '  )* ]]; then
		eerror "/usr/bin/ruby is currently not included in redmine's ruby targets: ${RUBY_TARGETS}."
		eerror "Please update it via `eselect ruby`"
		die
	fi

	local RUBY=${RUBY:-ruby}
	einfo "Upgrading the plugin migrations."
	cd "${EPREFIX}${REDMINE_DIR}" || die
	RAILS_ENV="${RAILS_ENV}" ${RUBY} -S rake redmine:plugins:migrate || die
}
