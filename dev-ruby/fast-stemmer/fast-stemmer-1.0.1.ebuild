# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="README"
RUBY_FAKEGEM_EXTRAINSTALL="test ext"

inherit toolchain-funcs ruby-fakegem

DESCRIPTION="Simple wrapper around multithreaded Porter stemming algorithm"
HOMEPAGE="https://github.com/romanbsd/fast-stemmer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_compile(){
	local RUBY_SONAME=$(${RUBY} -rrbconfig -e \
		"puts(RbConfig::CONFIG['RUBY_SO_NAME'])")
	cd ext || die
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -I $(ruby_get_hdrdir)/ruby \
	-I $(ruby_get_hdrdir) -I$(ruby_get_hdrdir)/$(tc-arch-kernel)-linux/ \
	-fPIC -shared -o stemmer.so -l${RUBY_SONAME} -ldl  porter.c porter_wrap.c
	cp stemmer.so ../lib || die
}
