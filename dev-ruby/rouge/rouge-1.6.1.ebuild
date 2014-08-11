# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/kramdown/kramdown-1.2.0-r1.ebuild,v 1.1 2013/10/30 03:35:55 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_EXTRADOC="README.md AUTHORS CONTRIBUTERS"
RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_RECIPE_DOC="yard"

inherit ruby-fakegem

DESCRIPTION="Yet-another-markdown-parser but fast, pure Ruby, using a strict syntax definition"
HOMEPAGE="http://github.com/jayferd/rouge"
SRC_URI="https://github.com/jayferd/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/redcarpet"

RESTRICT="test"
# Depends on dev-ruby/wrong, which is not packaged yet.
