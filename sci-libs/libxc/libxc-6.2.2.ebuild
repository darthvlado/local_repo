EAPI=8

inherit autotools fortran-2 flag-o-matic

DESCRIPTION="A library of exchange-correlation functionals for use in DFT"
HOMEPAGE="https://octopus-code.org/wiki/Libxc"
SRC_URI="https://gitlab.com/libxc/libxc/-/archive/${PV}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"

pkg_setup() {
	fortran-2_pkg_setup
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	append-flags -fPIC
	econf
}
