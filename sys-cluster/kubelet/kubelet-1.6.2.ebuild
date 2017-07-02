# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit user golang-build golang-vcs-snapshot

EGO_PN="k8s.io/kubernetes/..."
ARCHIVE_URI="https://github.com/kubernetes/kubernetes/archive/v${PV}.tar.gz -> kubernetes-${PV}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Kubernetes Node Agent"
HOMEPAGE="https://github.com/kubernetes/kubernetes https://kubernetes.io"
SRC_URI="${ARCHIVE_URI}"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-go/go-bindata"

src_prepare() {
	default
	sed -i -e "/vendor\/github.com\/jteeuwen\/go-bindata\/go-bindata/d" src/${EGO_PN%/*}/hack/lib/golang.sh || die
	sed -i -e "/export PATH/d" src/${EGO_PN%/*}/hack/generate-bindata.sh || die
}

src_compile() {
	LDFLAGS="" GOPATH="${WORKDIR}/${P}" emake -j1 -C src/${EGO_PN%/*} WHAT=cmd/kubelet
}

src_install() {
	pushd src/${EGO_PN%/*} || die
	dobin _output/bin/kubelet
	popd || die
	keepdir /etc/kubernetes/manifests /var/log/kubernetes
	newinitd "${FILESDIR}"/kubelet.initd kubelet
	newconfd "${FILESDIR}"/kubelet.confd kubelet
	insinto /etc/logrotate.d
	doins "${FILESDIR}"/kubelet.logrotated kubelet
}
