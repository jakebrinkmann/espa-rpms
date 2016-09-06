#-----------------------------------------------------------------------------
# Makefile
#
# Project Name: ESPA RPM Building
#-----------------------------------------------------------------------------
.PHONY: check-environment all install clean product-formatter cloud-masking elevation spectral-indices

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




#-----------------------------------------------------------------------------
check-environment:
ifndef PREFIX
    $(error Environment variable PREFIX is not defined)
endif

