# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_6 python2_7 )

USE_RUBY="ruby18 ruby19"
RUBY_FAKEGEM_NAME="pygments.rb"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_EXTRAINSTALL="vendor/custom_lexers/github.py bench.rb cache-lexers.rb lexers"

inherit python-r1 ruby-fakegem

DESCRIPTION="Ruby wrapper for pygments syntax highlighter"
HOMEPAGE="http://github.com/tmm1/pygments.rb http://rubygems.org/gems/pygments.rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/posix-spawn
	dev-ruby/yajl-ruby"
RDEPEND+=" >=dev-python/pygments-1.6[${PYTHON_USEDEP}]
	${PYTHON_DEPS}"
# possible RDEP: simplejson

all_ruby_prepare() {
	rm -rf vendor/{pygments-main,simplejson}
}

src_install() {
	ruby-ng_src_install

	# install modules in appropriate python dirs
	mypythoninstall() {
		python_moduleinto ${PN}
		python_domodule "$(find "${S}" -type f -path "*custom_lexers/github.py" -print -quit)"
	}
	python_foreach_impl mypythoninstall
	# create implementation specific files for the script
	python_replicate_script $(find "${D}" -type f -path "*pygments/mentos.py" -print)
}

each_ruby_test() {
	python_export_best
	cd test
	${RUBY} -I../lib test_pygments.rb
}
