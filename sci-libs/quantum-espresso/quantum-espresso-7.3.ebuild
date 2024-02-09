EAPI=8

CMAKE_MAKEFILE_GENERATOR=emake
inherit cmake

DESCRIPTION="Quantum Espresso"
HOMEPAGE="https://gitlab.com/QEF/q-e"
LICENSE="GPL-2"

SRC_URI="https://gitlab.com/QEF/q-e/-/archive/qe-${PV}/q-e-qe-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/q-e-qe-${PV}"

SLOT="0"
KEYWORDS="~amd64"


src_configure() {
	local mycmakeargs=(
		-DCMAKE_C_COMPILER="mpicc"
		-DCMAKE_Fortran_COMPILER="mpif90"
		-DQE_MBD_INTERNAL=OFF
		-DQE_WANNIER90_INTERNAL=OFF
		#-DQE_DEVICEXLIB_INTERNAL=OFF
	)
	cmake_src_configure
}

src_compile() {
	cmake_build "$@" pp pw ld1 hp
}
