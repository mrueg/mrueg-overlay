# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/spf13/hugo/..."
GIT_COMMIT="24512fa82bb4b9a70eabb350589605d84bc63111"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A Fast and Flexible Static Site Generator built with love in Go"
HOMEPAGE="https://github.com/spf13/hugo"
SRC_URI="${ARCHIVE_URI}
	https://github.com/BurntSushi/toml/archive/99064174e013895bbd9b025c31100bd1d9b590ca.tar.gz -> BurntSushi-toml-99064174e013895bbd9b025c31100bd1d9b590ca.tar.gz
	https://github.com/PuerkitoBio/purell/archive/0bcb03f4b4d0a9428594752bd2a3b9aa0a9d4bd4.tar.gz -> PuerkitoBio-purell-0bcb03f4b4d0a9428594752bd2a3b9aa0a9d4bd4.tar.gz
	https://github.com/PuerkitoBio/urlesc/archive/5bd2802263f21d8788851d5305584c82a5c75d7e.tar.gz -> PuerkitoBio-urlesc-5bd2802263f21d8788851d5305584c82a5c75d7e.tar.gz
	https://github.com/bep/gitmap/archive/a1a71abe12823e27ae7507189fe2e914ba9626ac.tar.gz -> bep-gitmap-a1a71abe12823e27ae7507189fe2e914ba9626ac.tar.gz
	https://github.com/bep/inflect/archive/b896c45f5af983b1f416bdf3bb89c4f1f0926f69.tar.gz -> bep-inflect-b896c45f5af983b1f416bdf3bb89c4f1f0926f69.tar.gz
	https://github.com/dchest/cssmin/archive/fb8d9b44afdc258bfff6052d3667521babcb2239.tar.gz -> dchest-cssmin-fb8d9b44afdc258bfff6052d3667521babcb2239.tar.gz
	https://github.com/eknkc/amber/archive/70e65b69c34997098bf7cc8820b4af04a2191784.tar.gz -> eknkc-amber-70e65b69c34997098bf7cc8820b4af04a2191784.tar.gz
	https://github.com/fsnotify/fsnotify/archive/fd9ec7deca8bf46ecd2a795baaacf2b3a9be1197.tar.gz -> fsnotify-fsnotify-fd9ec7deca8bf46ecd2a795baaacf2b3a9be1197.tar.gz
	https://github.com/gorilla/websocket/archive/3ab3a8b8831546bd18fd182c20687ca853b2bb13.tar.gz -> gorilla-websocket-3ab3a8b8831546bd18fd182c20687ca853b2bb13.tar.gz
	https://github.com/kardianos/osext/archive/c2c54e542fb797ad986b31721e1baedf214ca413.tar.gz -> kardianos-osext-c2c54e542fb797ad986b31721e1baedf214ca413.tar.gz
	https://github.com/kyokomi/emoji/archive/7e06b236c489543f53868841f188a294e3383eab.tar.gz -> kyokomi-emoji-7e06b236c489543f53868841f188a294e3383eab.tar.gz
	https://github.com/miekg/mmark/archive/2d4f1dd6f87cad351b9323bbaa6f6c586f0c4bee.tar.gz -> miekg-mmark-2d4f1dd6f87cad351b9323bbaa6f6c586f0c4bee.tar.gz
	https://github.com/mitchellh/mapstructure/archive/bfdb1a85537d60bc7e954e600c250219ea497417.tar.gz -> mitchellh-mapstructure-bfdb1a85537d60bc7e954e600c250219ea497417.tar.gz
	https://github.com/nicksnyder/go-i18n/archive/f757c9f9b69c16ff69d38dbf224be28a7b6537bb.tar.gz -> nicksnyder-go-i18n-f757c9f9b69c16ff69d38dbf224be28a7b6537bb.tar.gz
	https://github.com/pelletier/go-toml/archive/017119f7a78a0b5fc0ea39ef6be09f03acf3345d.tar.gz -> pelletier-go-toml-017119f7a78a0b5fc0ea39ef6be09f03acf3345d.tar.gz
	https://github.com/pelletier/go-buffruneio/archive/df1e16fde7fc330a0ca68167c23bf7ed6ac31d6d.tar.gz -> pelletier-go-buffruneio-df1e16fde7fc330a0ca68167c23bf7ed6ac31d6d.tar.gz
	https://github.com/russross/blackfriday/archive/5f33e7b7878355cd2b7e6b8eefc48a5472c69f70.tar.gz -> russross-blackfriday-5f33e7b7878355cd2b7e6b8eefc48a5472c69f70.tar.gz
	https://github.com/spf13/afero/archive/90dd71edc4d0a8b3511dc12ea15d617d03be09e0.tar.gz -> spf13-afero-90dd71edc4d0a8b3511dc12ea15d617d03be09e0.tar.gz
	https://github.com/spf13/cast/archive/56a7ecbeb18dde53c6db4bd96b541fd9741b8d44.tar.gz -> spf13-cast-56a7ecbeb18dde53c6db4bd96b541fd9741b8d44.tar.gz
	https://github.com/spf13/cobra/archive/1dd5ff2e11b6dca62fdcb275eb804b94607d8b06.tar.gz -> spf13-cobra-1dd5ff2e11b6dca62fdcb275eb804b94607d8b06.tar.gz
	https://github.com/spf13/fsync/archive/cb2da332d00cbc04e4f3f677520dc3e7cc11874b.tar.gz -> spf13-fsync-cb2da332d00cbc04e4f3f677520dc3e7cc11874b.tar.gz
	https://github.com/spf13/jwalterweatherman/archive/fa7ca7e836cf3a8bb4ebf799f472c12d7e903d66.tar.gz -> spf13-jwalterweatherman-fa7ca7e836cf3a8bb4ebf799f472c12d7e903d66.tar.gz
	https://github.com/spf13/nitro/archive/24d7ef30a12da0bdc5e2eb370a79c659ddccf0e8.tar.gz -> spf13-nitro-24d7ef30a12da0bdc5e2eb370a79c659ddccf0e8.tar.gz
	https://github.com/spf13/pflag/archive/25f8b5b07aece3207895bf19f7ab517eb3b22a40.tar.gz -> spf13-pflag-25f8b5b07aece3207895bf19f7ab517eb3b22a40.tar.gz
	https://github.com/spf13/viper/archive/5ed0fc31f7f453625df314d8e66b9791e8d13003.tar.gz -> spf13-viper-5ed0fc31f7f453625df314d8e66b9791e8d13003.tar.gz
	https://github.com/shurcooL/sanitized_anchor_name/archive/1dba4b3954bc059efc3991ec364f9f9a35f597d2.tar.gz -> shurcooL-sanitized_anchor_name-1dba4b3954bc059efc3991ec364f9f9a35f597d2.tar.gz
	https://github.com/cpuguy83/go-md2man/archive/a65d4d2de4d5f7c74868dfa9b202a3c8be315aaa.tar.gz -> cpuguy83-go-md2man-a65d4d2de4d5f7c74868dfa9b202a3c8be315aaa.tar.gz
	https://github.com/hashicorp/hcl/archive/80e628d796135357b3d2e33a985c666b9f35eee1.tar.gz -> hashicorp-hcl-80e628d796135357b3d2e33a985c666b9f35eee1.tar.gz
	https://github.com/yosssi/ace/archive/ea038f4770b6746c3f8f84f14fa60d9fe1205b56.tar.gz -> yosssi-ace-ea038f4770b6746c3f8f84f14fa60d9fe1205b56.tar.gz
	https://github.com/magiconair/properties/archive/9c47895dc1ce54302908ab8a43385d1f5df2c11c.tar.gz -> magiconair-properties-9c47895dc1ce54302908ab8a43385d1f5df2c11c.tar.gz
	https://github.com/golang/net/archive/45e771701b814666a7eb299e6c7a57d0b1799e91.tar.gz -> golang-net-45e771701b814666a7eb299e6c7a57d0b1799e91.tar.gz
	https://github.com/golang/sys/archive/d75a52659825e75fff6158388dddc6a5b04f9ba5.tar.gz -> golang-sys-d75a52659825e75fff6158388dddc6a5b04f9ba5.tar.gz
	https://github.com/golang/text/archive/a49bea13b776691cb1b49873e5d8df96ec74831a.tar.gz -> golang-text-a49bea13b776691cb1b49873e5d8df96ec74831a.tar.gz
	https://github.com/go-yaml/yaml/archive/a5b47d31c556af34a302ce5d659e6fea44d90de0.tar.gz -> go-yaml-yaml-a5b47d31c556af34a302ce5d659e6fea44d90de0.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

_golang-include-src() {
	local VENDORPN=$1 TARBALL=$2
	mkdir -p "${WORKDIR}/${P}/src/${VENDORPN}" || die
	tar -C "${WORKDIR}/${P}/src/${VENDORPN}" -x --strip-components 1\
		-f "${DISTDIR}"/${TARBALL} || die
}

src_unpack() {
	golang-vcs-snapshot_src_unpack
	_golang-include-src github.com/BurntSushi/toml BurntSushi-toml-*.tar.gz
	_golang-include-src github.com/PuerkitoBio/purell PuerkitoBio-purell-*.tar.gz
	_golang-include-src github.com/PuerkitoBio/urlesc PuerkitoBio-urlesc-*.tar.gz
	_golang-include-src github.com/bep/gitmap bep-gitmap-*.tar.gz
	_golang-include-src github.com/bep/inflect bep-inflect-*.tar.gz
	_golang-include-src github.com/dchest/cssmin dchest-cssmin-*.tar.gz
	_golang-include-src github.com/eknkc/amber eknkc-amber-*.tar.gz
	_golang-include-src github.com/fsnotify/fsnotify fsnotify-fsnotify-*.tar.gz
	_golang-include-src github.com/gorilla/websocket gorilla-websocket-*.tar.gz
	_golang-include-src github.com/kardianos/osext kardianos-osext-*.tar.gz
	_golang-include-src github.com/kyokomi/emoji kyokomi-emoji-*.tar.gz
	_golang-include-src github.com/miekg/mmark miekg-mmark-*.tar.gz
	_golang-include-src github.com/mitchellh/mapstructure mitchellh-mapstructure-*.tar.gz
	_golang-include-src github.com/nicksnyder/go-i18n nicksnyder-go-i18n-*.tar.gz
	_golang-include-src github.com/pelletier/go-toml pelletier-go-toml-*.tar.gz
	_golang-include-src github.com/pelletier/go-buffruneio pelletier-go-buffruneio-*.tar.gz
	_golang-include-src github.com/russross/blackfriday russross-blackfriday-*.tar.gz
	_golang-include-src github.com/spf13/afero spf13-afero-*.tar.gz
	_golang-include-src github.com/spf13/cast spf13-cast-*.tar.gz
	_golang-include-src github.com/spf13/cobra spf13-cobra-*.tar.gz
	_golang-include-src github.com/spf13/fsync spf13-fsync-*.tar.gz
	_golang-include-src github.com/spf13/jwalterweatherman spf13-jwalterweatherman-*.tar.gz
	_golang-include-src github.com/spf13/nitro spf13-nitro-*.tar.gz
	_golang-include-src github.com/spf13/pflag spf13-pflag-*.tar.gz
	_golang-include-src github.com/spf13/viper spf13-viper-*.tar.gz
	_golang-include-src github.com/shurcooL/sanitized_anchor_name shurcooL-sanitized_anchor_name-*.tar.gz
	_golang-include-src github.com/cpuguy83/go-md2man cpuguy83-go-md2man-*.tar.gz
	_golang-include-src github.com/hashicorp/hcl hashicorp-hcl-*.tar.gz
	_golang-include-src github.com/yosssi/ace yosssi-ace-*.tar.gz
	_golang-include-src github.com/magiconair/properties magiconair-properties-*.tar.gz
	_golang-include-src golang.org/x/sys golang-sys-*.tar.gz
	_golang-include-src golang.org/x/net golang-net-*.tar.gz
	_golang-include-src golang.org/x/text golang-text-*.tar.gz
	_golang-include-src gopkg.in/yaml.v2 go-yaml-*.tar.gz
	}

src_prepare() {
	default
	sed -i -e "s/^COMMIT_HASH.*/COMMIT_HASH = ${GIT_COMMIT}/" -e "s/install: vendor/install:/" src/${EGO_PN%/.*}/Makefile || die
}

src_compile() {
	GOPATH="${WORKDIR}/${P}" emake -C src/${EGO_PN%/.*} install || die
}

src_install() {
	dobin bin/*
}
