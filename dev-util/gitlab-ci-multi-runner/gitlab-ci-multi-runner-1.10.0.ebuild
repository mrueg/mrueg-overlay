# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_PN="gitlab.com/gitlab-org/gitlab-ci-multi-runner/..."

DESCRIPTION="Official GitLab CI Runner written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-ci-multi-runner"
SRC_URI="https://gitlab.com/gitlab-org/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz
	!docker-build? ( https://dev.gentoo.org/~mrueg/files/${P}-prebuilt-x86_64.tar.xz
		https://dev.gentoo.org/~mrueg/files/${P}-prebuilt-arm.tar.xz )"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
IUSE="docker-build"

DEPEND="dev-go/gox
	dev-go/go-bindata
	docker-build? ( >=app-emulation/docker-1.5 )"

RESTRICT="test"

src_prepare() {
	if ! use docker-build; then
		mkdir -p src/${EGO_PN%/*}/out/docker || die
		cp "${DISTDIR}"/${P}-prebuilt-x86_64.tar.xz src/${EGO_PN%/*}/out/docker/prebuilt-x86_64.tar.xz || die
		cp "${DISTDIR}"/${P}-prebuilt-arm.tar.xz src/${EGO_PN%/*}/out/docker/prebuilt-arm.tar.xz || die
	else
		einfo "You need to have docker running on your system during build time"
		einfo "$(docker info)"
	fi
}

src_compile() {
	emake GOPATH="${WORKDIR}/${P}:$(get_golibdir_gopath)" RELEASE=true -C src/${EGO_PN%/*} build
}

src_install() {
	newbin src/${EGO_PN%/*}/out/binaries/gitlab-ci-multi-runner-linux-amd64 gitlab-ci-multi-runner
	dodoc src/${EGO_PN%/*}/README.md src/${EGO_PN%/*}/CHANGELOG.md
}
