#-----------------------------------------------------------------------------
# Makefile
#
# Project Name: ESPA RPM Building
#-----------------------------------------------------------------------------
.PHONY: check-environment all install clean product-formatter cloud-masking elevation spectral-indices surface-water-extent surface-water-extent-dswe surface-water-extent-cfbwd

all:

install:

clean:

#-----------------------------------------------------------------------------
product-formatter: check-environment
	rpmbuild -bb --clean specs/espa-product-formatter.spec

cloud-masking: check-environment
	rpmbuild -bb --clean specs/espa-cfmask.spec

elevation: check-environment
	rpmbuild -bb --clean specs/espa-elevation.spec

spectral-indices: check-environment
	rpmbuild -bb --clean specs/espa-spectral-indices.spec

surface-water-extent: check-environment
	rpmbuild -bb --clean specs/espa-surface-water-extent.spec

surface-water-extent-dswe: check-environment
	rpmbuild -bb --clean specs/espa-surface-water-extent-dswe.spec

surface-water-extent-cfbwd: check-environment
	rpmbuild -bb --clean specs/espa-surface-water-extent-cfbwd.spec




#-----------------------------------------------------------------------------
check-environment:
ifndef PREFIX
    $(error Environment variable PREFIX is not defined)
endif

