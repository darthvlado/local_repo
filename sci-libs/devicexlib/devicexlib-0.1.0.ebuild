EAPI=8

DESCRIPTION="deviceXlib"
HOMEPAGE="https://gitlab.com/max-centre/components/devicexlib"
LICENSE="GPL-2"

SRC_URI="https://gitlab.com/max-centre/components/devicexlib/-/archive/${PV}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

#src_configure() {
#	local mycmakeargs=(
#		-DDEVXLIB_ENABLE_ACC="OPENACC"
#		#-DDEVXLIB_ENABLE_GPU_BLAS=OFF
#	)
#	cmake_src_configure
#}

#src_compile() {
#	cmake_build "$@" pp pw ld1 hp
#}
