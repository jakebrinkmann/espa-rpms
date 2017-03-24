#-----------------------------------------------------------------------------
# Makefile
#
# Project Name: ESPA RPM Building
#-----------------------------------------------------------------------------
.PHONY: check-environment all base schemas science install clean product-formatter product-formatter-schemas l2qa-tools cloud-masking elevation spectral-indices surface-water-extent surface-water-extent-dswe surface-water-extent-cfbwd surface-reflectance surface-reflectance-ledaps surface-reflectance-lasrc land-surface-temperature land-surface-temperature-rit surface-temperature-aux

all:

base: product-formatter

schemas: product-formatter-schemas

science: l2qa-tools cloud-masking elevation spectral-indices surface-water-extent surface-water-extent-dswe surface-water-extent-cfbwd surface-reflectance surface-reflectance-ledaps surface-reflectance-lasrc land-surface-temperature land-surface-temperature-rit

auxiliary: surface-temperature-aux

install:

clean:

#-----------------------------------------------------------------------------
product-formatter: check-environment
	rpmbuild -bb --clean specs/espa-product-formatter.spec

product-formatter-schemas: check-environment
	rpmbuild -bb --clean specs/espa-product-formatter-schemas.spec

l2qa-tools: check-environment
	rpmbuild -bb --clean specs/espa-l2qa-tools.spec

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

surface-reflectance: check-environment
	rpmbuild -bb --clean specs/espa-surface-reflectance.spec

surface-reflectance-ledaps: check-environment
	rpmbuild -bb --clean specs/espa-surface-reflectance-ledaps.spec

surface-reflectance-lasrc: check-environment
	rpmbuild -bb --clean specs/espa-surface-reflectance-lasrc.spec

land-surface-temperature: check-environment
	rpmbuild -bb --clean specs/espa-land-surface-temperature.spec

land-surface-temperature-rit: check-environment
	rpmbuild -bb --clean specs/espa-land-surface-temperature-rit.spec

surface-temperature-aux: check-environment
	rpmbuild -bb --clean specs/espa-surface-temperature-aux.spec

#-----------------------------------------------------------------------------
check-environment:
ifndef PREFIX
    $(error Environment variable PREFIX is not defined)
endif

