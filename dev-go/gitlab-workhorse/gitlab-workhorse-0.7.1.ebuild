# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit golang-build golang-vcs-snapshot

EGO_SRC=gitlab.com/gitlab-org/${PN}
EGO_PN=${EGO_SRC}/...

ARCHIVE_URI="https://${EGO_SRC}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="A smart reverse proxy for GitLab written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-workhorse"
SRC_URI="${ARCHIVE_URI}"
LICENSE="MIT"
SLOT="0/${PVR}"
IUSE=""

RESTRICT="test"

src_prepare() {
	# Fix relative imports
	pushd src/${EGO_SRC} || die
	sed -i -e "s#\./#${EGO_SRC}/#" main.go || die
	sed -i -e "s#\.\./#${EGO_SRC}/internal/#" internal/upstream/routes.go internal/api/api.go \
		internal/artifacts/artifact_download.go internal/badgateway/roundtripper.go \
		internal/artifacts/artifacts_upload.go internal/git/git-http.go \
		internal/git/archive.go internal/lfs/lfs.go internal/proxy/proxy.go \
		internal/git/blob.go internal/sendfile/sendfile.go internal/staticpages/deploy_page.go \
		internal/upload/uploads.go internal/staticpages/error_pages.go internal/upstream/upstream.go \
		internal/staticpages/servefile.go internal/upstream/handlers.go || die
	sed -i -e "s#\.\./\.\./#${EGO_SRC}/#" cmd/gitlab-zip-cat/main.go cmd/gitlab-zip-metadata/main.go || die
	popd || die
}
