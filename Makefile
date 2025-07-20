export TOPDIR	:=	$(CURDIR)

export DSWIFI_MAJOR	:= 0
export DSWIFI_MINOR	:= 4
export DSWIFI_REVISION	:= 2

VERSION	:=	$(DSWIFI_MAJOR).$(DSWIFI_MINOR).$(DSWIFI_REVISION)

.PHONY: release debug clean all

all: include/dswifi_version.h release debug

include/dswifi_version.h : Makefile
	@echo "#ifndef _dswifi_version_h_" > $@
	@echo "#define _dswifi_version_h_" >> $@
	@echo >> $@
	@echo "#define DSWIFI_MAJOR    $(DSWIFI_MAJOR)" >> $@
	@echo "#define DSWIFI_MINOR    $(DSWIFI_MINOR)" >> $@
	@echo "#define DSWIFI_REVISION $(DSWIFI_REVISION)" >> $@
	@echo >> $@
	@echo '#define DSWIFI_VERSION "'$(DSWIFI_MAJOR).$(DSWIFI_MINOR).$(DSWIFI_REVISION)'"' >> $@
	@echo >> $@
	@echo "#endif // _dswifi_version_h_" >> $@


#-------------------------------------------------------------------------------
release: lib
#-------------------------------------------------------------------------------
	echo $(LIBNDS)
	$(MAKE) -C arm9 BUILD=release
	$(MAKE) -C arm7 BUILD=release

#-------------------------------------------------------------------------------
debug: lib
#-------------------------------------------------------------------------------
	$(MAKE) -C arm9 BUILD=debug
	$(MAKE) -C arm7 BUILD=debug

#-------------------------------------------------------------------------------
lib:
#-------------------------------------------------------------------------------
	mkdir lib

#-------------------------------------------------------------------------------
clean:
#-------------------------------------------------------------------------------
	@$(MAKE) -C arm9 clean
	@$(MAKE) -C arm7 clean

