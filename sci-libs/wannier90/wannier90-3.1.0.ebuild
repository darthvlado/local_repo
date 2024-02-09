EAPI=8

inherit prefix

DESCRIPTION="Wannier90"
HOMEPAGE="https://github.com/wannier-developers/wannier90"
LICENSE="GPL-2"

SRC_URI="https://github.com/wannier-developers/wannier90/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="amd64"
RESTRICT="primaryuri"

src_prepare() {
	default

	cat <<- EOF >> "${S}"/make.inc
		F90 = gfortran
		FCOPTS = ${FFLAGS} -fPIC
		LDOPTS = ${LDFLAGS}
		LIBS = -lopenblas
	EOF

	hprefixify Makefile
}

src_compile() {
        emake
        emake w90chk2chk
        emake lib
}

src_install() {
	emake DESTDIR="${D}" install
	#doheader src/obj/w90_io.mod
	mkdir -p "${ED}/usr/include"
	cp "${S}/src/obj/w90_io.mod" "${ED}/usr/include"
}

#src_test() {
#	einfo "Compare the 'Standard' and 'Current' outputs of this test."
#	cd test-suite || die
#	./run_tests --default || die
#}
