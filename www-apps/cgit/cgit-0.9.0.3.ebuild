# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

WEBAPP_MANUAL_SLOT="yes"

inherit webapp user eutils multilib

[[ -z "${CGIT_CACHEDIR}" ]] && CGIT_CACHEDIR="/var/cache/${PN}/"

GIT_V="1.7.4"

DESCRIPTION="a fast web-interface for git repositories"
HOMEPAGE="http://hjemli.net/git/cgit/about/"
SRC_URI="mirror://kernel/software/scm/git/git-${GIT_V}.tar.bz2
	http://hjemli.net/git/cgit/snapshot/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc highlight"

RDEPEND="
	dev-vcs/git
	sys-libs/zlib
	dev-libs/openssl
	virtual/httpd-cgi
	highlight? ( app-text/highlight )
"
# ebuilds without WEBAPP_MANUAL_SLOT="yes" are broken
DEPEND="${RDEPEND}
	doc? ( app-text/docbook-xsl-stylesheets
		>=app-text/asciidoc-8.5.1 )
"

pkg_setup() {
	webapp_pkg_setup
	enewuser "${PN}"
}

src_prepare() {
	rmdir git || die
	mv "${WORKDIR}"/git-"${GIT_V}" git || die

	epatch "${FILESDIR}"/use-highlight-version-3.patch || die
	if has_version "<app-text/highlight-3.5"; then
		epatch "${FILESDIR}"/work-around-highlight-force-bug.patch || die
	fi

	sed -i \
		-e "/^CACHE_ROOT =/s:/var/cache/cgit:${CGIT_CACHEDIR}:" \
		Makefile || die
}

src_compile() {
	emake
	use doc && emake doc-man
}

src_install() {
	webapp_src_preinst

	emake \
		prefix="${EPREFIX}"/usr \
		libdir="${EPREFIX}"/usr/$(get_libdir) \
		CGIT_SCRIPT_PATH="${MY_CGIBINDIR}" \
		CGIT_DATA_PATH="${MY_HTDOCSDIR}" \
		DESTDIR="${D}" install

	insinto /etc
	doins "${FILESDIR}"/cgitrc

	dodoc README
	use doc && doman cgitrc.5

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en.txt
	webapp_src_install

	keepdir "${CGIT_CACHEDIR}"
	fowners ${PN}:${PN} "${CGIT_CACHEDIR}"
	fperms 700 "${CGIT_CACHEDIR}"
}

pkg_postinst() {
	webapp_pkg_postinst
	ewarn "If you intend to run cgit using web server's user"
	ewarn "you should change ${CGIT_CACHEDIR} permissions."
}
