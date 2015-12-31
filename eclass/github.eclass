# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# @ECLASS: github.eclass
# @MAINTAINER:
# mrueg@gentoo.org
# @BLURB: Support eclass for packages hosted on Github.
# @DESCRIPTION:
# The github.eclass provides support for packages hosted on Github.

if [[ -z ${_GH_ECLASS} ]]; then
_GH_ECLASS=1

case "${EAPI:-0}" in
	5)
		;;
	*)
		die "Unsupported EAPI=${EAPI} (unknown) for ${ECLASS}"
		;;
esac

# @ECLASS-VARIABLE: GH_USER
# @DESCRIPTION:
# Github user, usually a project or user.
: ${GH_USER:=${PN}}

# @ECLASS-VARIABLE: GH_REPO
# @DESCRIPTION:
# Github repository name.
: ${GH_REPO:=${PN}}

# @ECLASS-VARIABLE: GH_BUILD_TYPE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Defines if fetched from git ("live") or tarball ("release")
: ${GH_BUILD_TYPE:=release}

# @ECLASS-VARIABLE: GH_PATCHES
# @DEFAULT_UNSET
# @DESCRIPTION:
# Patches, pull requests, patches from forks to be fetched and applied.
# Prefix:
# f: - Regular patch from FILESDIR
# c: - Patch identified by commit, optional: fork name
# p: - Patch identified by pull request id, optional: fork name
# Example:
# @CODE
# GH_PATCHES=("c:b02c39fb8dec9043b0ac9d23d5caec19b8b0c337" "c:gentoo/b0c337b02c39fb8dec9043b0ac9d23d5caec19b8" "foo.patch" "p:1" "p:gentoo/17" )
# @CODE

# @ECLASS-VARIABLE: GH_TAG
# @DESCRIPTION:
# Tag/commit that is fetched from Github.
: ${GH_TAG:=${PV}}


inherit eutils

if [[ ${GH_BUILD_TYPE} = live ]]; then
	inherit git-r3
fi

if [[ ${GH_BUILD_TYPE} = release ]]; then
	inherit vcs-snapshot
fi

HOMEPAGE="https://github.com/${GH_USER}/${GH_REPO}"

EXPORT_FUNCTIONS src_prepare src_unpack

_patch_calc_filesdir() {
	debug-print-function ${FUNCNAME} "$@"

	local gh_filepatch="$1"
	_GH_PATCHES+=($gh_filepatch)
}

_patch_calc_commit() {
	debug-print-function ${FUNCNAME} "$@"

	local gh_patch="$1"
	local gh_commit=${gh_patch##*/}
	local gh_fork=${GH_USER}
	local gh_forkedby=""
	if [[ "${gh_patch}" == */* ]]; then 
		gh_fork=${gh_patch%%/*}
		gh_forkedby=${gh_fork}-
	fi
	SRC_URI+=" https://github.com/${GH_USER}/${GH_REPO}/commit/${gh_commit}.patch -> ${PN}-${gh_forkedby}${gh_commit}.patch"
	_GH_PATCHES+=("${DISTDIR}"/${PN}-${gh_forkedby}${gh_commit}.patch)
}

_patch_calc_pull-request() {
	debug-print-function ${FUNCNAME} "$@"

	local gh_patch="$1"
	local gh_pullreq=${gh_patch##*/}
	local gh_fork=${GH_USER}
	local gh_forkedby=""

	if [[ "${gh_patch}" == */* ]]; then 
		gh_fork=${gh_patch%%/*}
		gh_forkedby=${gh_fork}-
	fi
 
	SRC_URI+=" https://github.com/${gh_fork}/${GH_REPO}/pull/${gh_pullreq}.patch -> ${PN}-pr${gh_forkedby}-${gh_pullreq}.patch"
	_GH_PATCHES+=("${DISTDIR}"/${PN}-pr-${gh_forkedby}${gh_pullreq}.patch)
}

# If patches are fetched, calculate their location
_calculate_patches_uri() {
	if [[ -n $GH_PATCHES ]]; then
		for gh_commit in "${GH_PATCHES[@]}"; do
			case ${gh_commit:0:1} in
				f) _patch_calc_filesdir "${gh_commit:2}"
				;;
				c) _patch_calc_commit "${gh_commit:2}"
				;;
				p) _patch_calc_pull-request "${gh_commit:2}"
				;;
				*) die "Wrong patch pattern: ${gh_commit}"
				;;
			esac
		done
	fi
}


# Determine fetch location for tarballs and patches
_calculate_src_uri() {
	debug-print-function ${FUNCNAME} "$@"

	SRC_URI="https://github.com/${GH_USER}/${GH_REPO}/archive/${GH_TAG}.tar.gz -> ${P}.tar.gz"
}

# Determine fetch location for live sources
_calculate_live_repo() {
	debug-print-function ${FUNCNAME} "$@"

	SRC_URI=""
	# @ECLASS-VARIABLE: EGIT_MIRROR
	# @DESCRIPTION:
	# This variable allows easy overriding of github uri.
	# (uses https) with anything else you might want to use.
	EGIT_MIRROR=${EGIT_MIRROR:=https://github.com}
	
	EGIT_REPO_URI="${EGIT_MIRROR}/${GH_USER}/${GH_REPO}.git"
}


case ${GH_BUILD_TYPE} in
	live) _calculate_live_repo ;;
	release) _calculate_src_uri ;;
esac
_calculate_patches_uri

debug-print "${LINENO} ${ECLASS} ${FUNCNAME}: SRC_URI is ${SRC_URI}"

# @FUNCTION: github_src_unpack
# @DESCRIPTION:
# Function for unpacking Github packages.
github_src_unpack() {
	debug-print-function ${FUNCNAME} "$@"

	if [[ ${GH_BUILD_TYPE} = live ]]; then
		git-r3_src_unpack
	else
		vcs-snapshot_src_unpack
	fi
}


# @FUNCTION: github_src_prepare
# @DESCRIPTION:
# Function for applying patches to Github packages.
github_src_prepare() {
	debug-print-function ${FUNCNAME} "$@"

	[[ $_GH_PATCHES ]] && epatch "${_GH_PATCHES[@]}"
	epatch_user
	default
}

fi
