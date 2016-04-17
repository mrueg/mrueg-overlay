# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="gitlab.com/gitlab-org/gitlab-ci-multi-runner/..."

DESCRIPTION="A smart reverse proxy for GitLab written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-ci-multi-runner"
SRC_URI="https://gitlab.com/gitlab-org/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz
	!docker-build? ( https://dev.gentoo.org/~mrueg/files/${P}-prebuilt.tar.gz )"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0/${PVR}"
IUSE="docker-build"

DEPEND="dev-go/gox
	dev-go/go-bindata"

RESTRICT="test"

src_prepare() {
	sed -i -e 's/VERSION=.*/VERSION=${PV}/' src/${EGO_PN%/*}/Makefile || die
	if ! use docker-build; then
		mkdir -p src/${EGO_PN%/*}/out/docker || die
		cp "${DISTDIR}"/${P}-prebuilt.tar.gz src/${EGO_PN%/*}/out/docker/prebuilt.tar.gz || die
	else
		einfo "You need to have docker running on your system during build time"
		einfo "$(docker info)"
	fi
}

src_compile() {
	emake GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" RELEASE=true -C src/${EGO_PN%/*} build
}

src_install() {
	golang-build_src_install
	dobin bin/*
	dodoc src/${EGO_PN%/*}/README.md src/${EGO_PN%/*}/CHANGELOG.md
}
