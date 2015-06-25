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
# @DEFAULT-UNSET
# @DESCRIPTION:
# Defines if fetched from git ("live") or tarball ("release")
# Use if autodetection via PV fails.

# @ECLASS-VARIABLE: GH_PATCHES
# @DEFAULT_UNSET
# @DESCRIPTION:
# Patches to be fetched and applied from Github by commit id.
# Example:
# @CODE
# GH_PATCHES=("b02c39fb8dec9043b0ac9d23d5caec19b8b0c337" "b0c337b02c39fb8dec9043b0ac9d23d5caec19b8" )
# @CODE

# @ECLASS-VARIABLE: GH_PULLREQS
# @DEFAULT_UNSET
# @DESCRIPTION:
# Pull requests to be fetched and applied from Github by its id.
# Example:
# @CODE
# GH_PULLREQS=(17 19)
# @CODE


# @ECLASS-VARIABLE: GH_TAG
# @DESCRIPTION:
# Tag/commit that is fetched from Github.
: ${GH_TAG:=${PV}}


inherit eutils

if [[ -z ${GH_BUILD_TYPE}  ]]; then
	if [[ ${PV} == *9999 ]]; then
		_GH_BUILD_TYPE=live
	else
		_GH_BUILD_TYPE=release
	fi
else 
	_GH_BUILD_TYPE=$GH_BUILD_TYPE
fi

if [[ ${_GH_BUILD_TYPE} = live ]]; then
	inherit git-r3
fi

if [[ ${_GH_BUILD_TYPE} = release ]]; then
	inherit vcs-snapshot
fi

HOMEPAGE="https://github.com/${GH_USER}/${GH_REPO}"

EXPORT_FUNCTIONS src_prepare src_unpack


# If patches are fetched, calculate their location
_calculate_patches_uri() {
	if [[ -n $GH_PATCHES ]]; then
		for gh_commit in "${GH_PATCHES[@]}"; do
			SRC_URI+=" https://github.com/${GH_USER}/${GH_REPO}/commit/${gh_commit}.patch -> ${PN}-${gh_commit}.patch"
			_GH_PATCHES+=("${DISTDIR}"/${PN}-${gh_commit}.patch)
		done
	fi
	if [[ -n $GH_PULLREQ ]]; then 
			for gh_pullreqid in "${GH_PULLREQS[@]}"; do
			SRC_URI+=" https://github.com/${GH_USER}/${GH_REPO}/pull//${gh_pullreq}.patch -> ${PN}-pr-${gh_pullreq}.patch"
			_GH_PATCHES+=("${DISTDIR}"/${PN}-pr-${gh_pullreqid}.patch)
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
	# This variable allows easy overriding of default kde mirror service
	# (anongit) with anything else you might want to use.
	EGIT_MIRROR=${EGIT_MIRROR:=https://github.com}
	
	EGIT_REPO_URI="${EGIT_MIRROR}/${GH_USER}/${GH_REPO}.git"
}


case ${_GH_BUILD_TYPE} in
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

	if [[ ${_GH_BUILD_TYPE} = live ]]; then
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
