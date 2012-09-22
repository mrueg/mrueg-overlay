# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README"

inherit ruby-fakegem

DESCRIPTION="Module to allow Bayesian and other types of classifications"
HOMEPAGE="http://rubyforge.org/projects/classifier  https://github.com/cardmagic/classifier"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gsl"

ruby_add_rdepend ">=dev-ruby/fast-stemmer-1.0.0"
ruby_add_rdepend "gsl? ( dev-ruby/rb-gsl )"

all_ruby_prepare(){
	if use !gsl; then
		sed -e 's/$GSL = true/$GSL = false/' -i lib/${PN}/lsi.rb || die
	fi
}

each_ruby_test(){
	cd test/lsi || die
	${RUBY} lsi_test.rb || die
	cd ../extensions || die
	${RUBY} word_hash_test.rb || die
	cd ../bayes || die
	${RUBY} bayesian_test.rb || die
}
