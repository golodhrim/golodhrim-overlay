# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git x-modular

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/xpyb"
EGIT_BRANCH="master"
DESCRIPTION="XCB-based Python bindings for the X Window System"
HOMEPAGE="http://xcb.freedesktop.org/ http://pypi.python/pypi/xpyb"

KEYWORDS="~amd64 ~x86"
IUSE="selinux"

RDEPEND=">=x11-libs/libxcb-1.1
	>=dev-lang/python-2.5"
DEPEND="${RDEPEND}
	>=x11-proto/xcb-proto-1.2"

S="${WORKDIR}"/${PN}
DOCS="NEWS README"

pkg_setup() {
	CONFIGURE_OPTIONS="$(use_enable selinux xselinux)"
}

src_unpack() {
	x-modular_src_unpack

	eautoreconf
}
