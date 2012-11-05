# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="python? 3"
inherit user python

MY_PV=${PV/_/-}
DESCRIPTION="An advanced IRC Bouncer"
HOMEPAGE="http://wiki.znc.in/ZNC"
SRC_URI="http://znc.in/releases/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="daemon debug ipv6 perl python ssl sasl tcl"

RDEPEND="
	perl? ( >=dev-lang/perl-5.10 )
	sasl? ( >=dev-libs/cyrus-sasl-2 )
	ssl? ( >=dev-libs/openssl-0.9.7d )
	tcl? ( dev-lang/tcl )
"
DEPEND="
	virtual/pkgconfig
	perl? ( dev-lang/swig )
	python? (
		>=dev-lang/swig-2.0.2
		>=dev-lang/perl-5.10
	)
	${RDEPEND}
"
S=${WORKDIR}/${PN}-${MY_PV}

pkg_setup() {
	if use python; then
		python_set_active_version 3
		python_pkg_setup
	fi
	if use daemon; then
		enewgroup ${PN}
		enewuser ${PN} -1 -1 /dev/null ${PN}
	fi
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable ipv6) \
		$(use_enable perl) \
		$(use python && echo "--enable-python=python-$(python_get_version)") \
		$(use_enable sasl cyrus) \
		$(use_enable ssl openssl) \
		$(use_enable tcl tcl)
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc AUTHORS README.md
	if use daemon; then
		newinitd "${FILESDIR}"/znc.init znc
	fi
}
pkg_postinst() {
	if use !daemon; then
		elog
		elog "Run 'znc --makeconf' as the user you want to run ZNC as"
		elog "to make a configuration file"
		elog "If you are using SSL you should also run 'znc --makepem'"
		elog
	fi
	if use daemon; then
		elog
		elog "An init-script was installed in /etc/init.d"
		elog "Run 'emerge --config znc' to configure ZNC"
		elog
	fi
}
pkg_config() {
	if use daemon && ! [[ -d "${ROOT}"/etc/znc ]]; then
		einfo "Press ENTER to create an initial znc config and set proper"
		einfo "permissions on it, or Control-C to abort now..."
		read
		mkdir -p "${ROOT}"/etc/znc || die
		"${ROOT}"/usr/bin/znc -c -r -d "${ROOT}"/etc/znc || die "Config failed"
		chown -R ${PN}:${PN} "${ROOT}"/etc/znc || die "Setting permissions failed"
	else
		einfo "You have already a znc configuration placed in /etc/znc"
		einfo "or you haven\'t compiled znc with USE=\"daemon\""
	fi
}
