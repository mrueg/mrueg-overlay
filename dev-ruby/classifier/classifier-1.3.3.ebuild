# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_EXTRAINSTALL="test"

inherit ruby-fakegem

DESCRIPTION="Module to allow Bayesian and other types of classifications"
HOMEPAGE="http://rubyforge.org/projects/classifier  https://github.com/cardmagic/classifier"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gsl"

ruby_add_bdepend ">=dev-ruby/fast-stemmer-1.0.0"
ruby_add_rdepend ">=dev-ruby/fast-stemmer-1.0.0"
if use gsl; then
	ruby_add_rdepend "dev-ruby/ruby-gsl"
	RDEPEND+=" sci-libs/gsl"
fi

all_ruby_prepare(){
	if use !gsl; then
		sed -e 's/$GSL = true/$GSL = false/' -i lib/${PN}/lsi.rb || die
	fi
}

#each_fakegem_test(){
#	${RUBY} test/lsi/lsi_test.rb || die "Test failed"
#	${RUBY} test/extensions/word_hash_test.rb || die "Test failed"
#	${RUBY} test/bayes/bayesian_test.rb || die "Test failed"
#}
