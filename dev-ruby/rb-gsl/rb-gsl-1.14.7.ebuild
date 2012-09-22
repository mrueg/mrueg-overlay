# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

inherit ruby-ng

DESCRIPTION="Ruby interface to GNU Scientific Library"
HOMEPAGE="http://rb-gsl.rubyforge.org/"
SRC_URI="http://rubyforge.org/frs/download.php/74341/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND+=" sci-libs/gsl"
RDEPEND+=" sci-libs/gsl"

all_ruby_prepare() {
	has_version >=sci-libs/gsl-1.15 && epatch "${FILESDIR}"/${P}-gsl-1.15.patch
}

each_ruby_prepare() {
	sed -e \
		"/ruby -w -I/ s:#\truby -w *:${RUBY} -w -I ../../lib -I ../../ext :" \
		-e "/ruby -w \`basename/ s/^/# /" -i tests/run-test.sh || die
}

each_ruby_configure() {
	${RUBY} setup.rb config || die
}

each_ruby_compile() {
	${RUBY} setup.rb setup || die
}

each_ruby_install() {
	${RUBY} setup.rb install --prefix="${D}" || die
}

# Tests fail
# level1.rb:76: undefined method `zscal' for #<GSL::Vector::Complex:0x7f29dbc76530> (NoMethodError)
each_ruby_test() {
	sh tests/run-test.sh || die
}
