# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem multilib

DESCRIPTION="Kerberos binding for Ruby"
HOMEPAGE="https://rubygems.org/gems/timfel-krb5-auth http://rubyforge.org/projects/krb5-auth/"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake V=1 -Cext
	mkdir lib || die
	cp ext/krb5_auth$(get_modname) lib/ || die
}
