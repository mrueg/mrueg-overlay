# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby21 ruby22 ruby23"
RUBY_FAKEGEM_TASK_DOC=""
inherit ruby-fakegem

DESCRIPTION="EmailReplyTrimmer is a small library to trim replies from plain text email"
HOMEPAGE="https://github.com/discourse/email_reply_trimmer https://rubygems.org/gems/email_reply_trimmer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/minitest )"

each_ruby_test() {
	${RUBY} -I lib test/test_email_reply_trimmer.rb || die
}
