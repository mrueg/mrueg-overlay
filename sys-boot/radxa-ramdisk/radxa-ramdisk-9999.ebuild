# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

EGIT_REPO_URI="https://github.com/neo-technologies/radxa_initrd.git"
inherit git-r3

DESCRIPTION="Ramdisk for radxa rock"
HOMEPAGE="https://radxa.com https://github.com/radxa/initrd"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-arch/cpio"

src_compile() {
	COMMIT_ID=$(git-r3_peek_remote_ref)
	find . ! -path "./.git*" ! -path "./README" ! -path "./Makefile"  | cpio -H newc -o > initrd-${COMMIT_ID}.img || die

}

src_install() {
	dodir /usr/src
	insinto /usr/src
	doins initrd-${COMMIT_ID}.img
}
