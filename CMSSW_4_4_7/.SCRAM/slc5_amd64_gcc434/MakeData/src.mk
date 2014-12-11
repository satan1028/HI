LIB :=
INCLUDE :=
USE :=
USE += self
LDFLAGS :=
CXXSHAREDOBJECTFLAGS :=
LD_UNIT :=
CXXFLAGS :=
CPPDEFINES :=
SCRAM_COMPILER_NAME :=
SCRAM_LANGUAGE_TYPE :=
CXXSHAREDFLAGS :=
CXXDEBUGFLAG :=
SHAREDSUFFIX :=
CCCOMPILER :=
MODULEFLAGS :=
CFLAGS :=
LDFLAGS :=
CDEBUGFLAG :=
SCRAM_COMPILER_NAME :=
SCRAM_LANGUAGE_TYPE :=
CSHAREDFLAGS :=
CSHAREDOBJECTFLAGS :=
FFLAGS :=
FCSHAREDOBJECTFLAGS :=
SCRAM_COMPILER_NAME :=
SCRAM_LANGUAGE_TYPE :=
FCOPTIMISED :=
FCO2FLAG :=
FCDEBUGFLAG :=
BIN_CXXFLAGS:=
TEST_CXXFLAGS:=
EDM_CXXFLAGS:=
CAPABILITIES_CXXFLAGS:=
LCGDICT_CXXFLAGS:=
ROOTDICT_CXXFLAGS:=
REM_BIN_CXXFLAGS:=
REM_TEST_CXXFLAGS:=
REM_EDM_CXXFLAGS:=
REM_CAPABILITIES_CXXFLAGS:=
REM_LCGDICT_CXXFLAGS:=
REM_ROOTDICT_CXXFLAGS:=
REM_CXXFLAGS:=
BIN_FFLAGS:=
TEST_FFLAGS:=
EDM_FFLAGS:=
CAPABILITIES_FFLAGS:=
LCGDICT_FFLAGS:=
ROOTDICT_FFLAGS:=
REM_BIN_FFLAGS:=
REM_TEST_FFLAGS:=
REM_EDM_FFLAGS:=
REM_CAPABILITIES_FFLAGS:=
REM_LCGDICT_FFLAGS:=
REM_ROOTDICT_FFLAGS:=
REM_FFLAGS:=
BIN_CFLAGS:=
TEST_CFLAGS:=
EDM_CFLAGS:=
CAPABILITIES_CFLAGS:=
LCGDICT_CFLAGS:=
ROOTDICT_CFLAGS:=
REM_BIN_CFLAGS:=
REM_TEST_CFLAGS:=
REM_EDM_CFLAGS:=
REM_CAPABILITIES_CFLAGS:=
REM_LCGDICT_CFLAGS:=
REM_ROOTDICT_CFLAGS:=
REM_CFLAGS:=
BIN_CPPFLAGS:=
TEST_CPPFLAGS:=
EDM_CPPFLAGS:=
CAPABILITIES_CPPFLAGS:=
LCGDICT_CPPFLAGS:=
ROOTDICT_CPPFLAGS:=
REM_BIN_CPPFLAGS:=
REM_TEST_CPPFLAGS:=
REM_EDM_CPPFLAGS:=
REM_CAPABILITIES_CPPFLAGS:=
REM_LCGDICT_CPPFLAGS:=
REM_ROOTDICT_CPPFLAGS:=
REM_CPPFLAGS:=
BIN_LDFLAGS:=
TEST_LDFLAGS:=
EDM_LDFLAGS:=
CAPABILITIES_LDFLAGS:=
LCGDICT_LDFLAGS:=
ROOTDICT_LDFLAGS:=
REM_BIN_LDFLAGS:=
REM_TEST_LDFLAGS:=
REM_EDM_LDFLAGS:=
REM_CAPABILITIES_LDFLAGS:=
REM_LCGDICT_LDFLAGS:=
REM_ROOTDICT_LDFLAGS:=
REM_LDFLAGS:=
LDFLAGS += $(cxxcompiler_LOC_FLAGS_LDFLAGS)
CXXSHAREDOBJECTFLAGS += $(cxxcompiler_LOC_FLAGS_CXXSHAREDOBJECTFLAGS)
LD_UNIT += $(cxxcompiler_LOC_FLAGS_LD_UNIT)
CXXFLAGS += $(cxxcompiler_LOC_FLAGS_CXXFLAGS)
CPPDEFINES += $(cxxcompiler_LOC_FLAGS_CPPDEFINES)
SCRAM_COMPILER_NAME := $(cxxcompiler_LOC_FLAGS_SCRAM_COMPILER_NAME)
SCRAM_LANGUAGE_TYPE := $(cxxcompiler_LOC_FLAGS_SCRAM_LANGUAGE_TYPE)
CXXSHAREDFLAGS += $(cxxcompiler_LOC_FLAGS_CXXSHAREDFLAGS)
CXXDEBUGFLAG += $(cxxcompiler_LOC_FLAGS_CXXDEBUGFLAG)
SHAREDSUFFIX := $(cxxcompiler_LOC_FLAGS_SHAREDSUFFIX)
CCCOMPILER := $(cxxcompiler_LOC_FLAGS_CCCOMPILER)
MODULEFLAGS += $(cxxcompiler_LOC_FLAGS_MODULEFLAGS)
CFLAGS += $(ccompiler_LOC_FLAGS_CFLAGS)
CDEBUGFLAG += $(ccompiler_LOC_FLAGS_CDEBUGFLAG)
CSHAREDFLAGS += $(ccompiler_LOC_FLAGS_CSHAREDFLAGS)
CSHAREDOBJECTFLAGS += $(ccompiler_LOC_FLAGS_CSHAREDOBJECTFLAGS)
FCSHAREDOBJECTFLAGS += $(f77compiler_LOC_FLAGS_FCSHAREDOBJECTFLAGS)
FCOPTIMISED += $(f77compiler_LOC_FLAGS_FCOPTIMISED)
FCO2FLAG += $(f77compiler_LOC_FLAGS_FCO2FLAG)
FCDEBUGFLAG += $(f77compiler_LOC_FLAGS_FCDEBUGFLAG)
GENREFLEX_CPPFLAGS := $(rootrflx_LOC_FLAGS_GENREFLEX_CPPFLAGS)
GENREFLEX_GCCXMLOPT := $(rootrflx_LOC_FLAGS_GENREFLEX_GCCXMLOPT)
GENREFLEX_ARGS := $(rootrflx_LOC_FLAGS_GENREFLEX_ARGS)
MISSING_SYMBOL_FLAGS+=-Wl,-z,defs
REM_LCGDICT_CXXFLAGS+=-O%
REM_LCGDICT_CPPFLAGS+=-O%
REM_ROOTDICT_CXXFLAGS+=-pedantic
LCGDICT_CXXFLAGS+=-Os


CXXSRC_FILES_SUFFIXES       := cxx cc C cpp
CSRC_FILES_SUFFIXES         := c
FORTRANSRC_FILES_SUFFIXES   := F f77 f F77
SRC_FILES_SUFFIXES          := $(CXXSRC_FILES_SUFFIXES) $(CSRC_FILES_SUFFIXES) $(FORTRANSRC_FILES_SUFFIXES)

ifeq ($(strip $(GENREFLEX)),)
GENREFLEX:=$(ROOTRFLX_BASE)/root/bin/genreflex
endif
ifeq ($(strip $(GENREFLEX_CPPFLAGS)),)
GENREFLEX_CPPFLAGS:=-DCMS_DICT_IMPL -D_REENTRANT -DGNU_SOURCE
endif
ifeq ($(strip $(GENREFLEX_ARGS)),)
GENREFLEX_ARGS:=--deep
endif
ifeq ($(strip $(ROOTCINT)),)
ROOTCINT:=$(ROOTRFLX_BASE)/bin/rootcint
endif

LIBDIR+=$(self_EX_LIBDIR)
ifdef RELEASETOP
ifeq ($(strip $(wildcard $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk)),)
$(error Release area has been removed/modified as $(RELEASETOP)/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk is missing.)
endif
endif
LIBTYPE:= 

subdirs_src+=$(filter-out Documentation, src_flowAnalysis)

EDM_WRITE_CONFIG:=edmWriteConfigs
EDM_CHECK_CLASS_VERSION:=$(SCRAM_SOURCEDIR)/FWCore/Utilities/scripts/edmCheckClassVersion
COMPILE_PYTHON_SCRIPTS:=yes
CPPDEFINES+=-DPROJECT_NAME='"$(SCRAM_PROJECTNAME)"' -DPROJECT_VERSION='"$(SCRAM_PROJECTVERSION)"'
.PHONY: dependencies
dependencies:
	@cd $(LOCALTOP); \
	mkdir -p $(LOCALTOP)/doc/deps/$(SCRAM_ARCH); \
	cd $(LOCALTOP)/doc/deps/$(SCRAM_ARCH); \
	ignominy -f -i -A -g all $(LOCALTOP)
.PHONY: userguide referencemanual doc
doc: referencemanual
	@echo "Documentation/release notes built for $(SCRAM_PROJECTNAME) v$(SCRAM_PROJECTVERSION)"
userguide:
	@if [ -f $(LOCALTOP)/src/Documentation/UserGuide/scripts/makedoc ]; then \
	  doctop=$(LOCALTOP); \
	else \
	  doctop=$(RELEASETOP); \
	fi; \
	cd $$doctop/src; \
	Documentation/UserGuide/scripts/makedoc $(LOCALTOP)/src $(LOCALTOP)/doc/UserGuide $(RELEASETOP)/src
referencemanual:
	@cd $(LOCALTOP)/src/Documentation/ReferenceManualScripts/config; \
	sed -e 's|@PROJ_NAME@|$(SCRAM_PROJECTNAME)|g' \
	-e 's|@PROJ_VERS@|$(SCRAM_PROJECTVERSION)|g' \
	-e 's|@CMSSW_BASE@|$(LOCALTOP)|g' \
	-e 's|@INC_PATH@|$(LOCALTOP)/src|g' \
	doxyfile.conf.in > doxyfile.conf; \
	cd $(LOCALTOP); \
	ls -d src/*/*/doc/*.doc | sed 's|(.*).doc|mv "&" "\1.dox"|' | /bin/sh; \
	if [ `expr substr $(SCRAM_PROJECTVERSION) 1 1` = "2" ]; then \
	  ./config/fixdocs.sh $(SCRAM_PROJECTNAME)"_"$(SCRAM_PROJECTVERSION); \
	else \
	  ./config/fixdocs.sh $(SCRAM_PROJECTVERSION); \
	fi; \
	ls -d src/*/*/doc/*.doy |  sed 's/(.*).doy/sed "s|@PROJ_VERS@|$(SCRAM_PROJECTVERSION)|g" "&" > "\1.doc"/' | /bin/sh; \
	rm -rf src/*/*/doc/*.doy; \
	cd $(LOCALTOP)/src/Documentation/ReferenceManualScripts/config; \
	doxygen doxyfile.conf; \
	cd $(LOCALTOP); \
	ls -d src/*/*/doc/*.dox | sed 's|(.*).dox|mv "&" "\1.doc"|' | /bin/sh;
.PHONY: gindices
gindices:
	@cd $(LOCALTOP)/src; \
	rm -rf  $(LOCALTOP)/src/.glimpse_full; mkdir  $(LOCALTOP)/src/.glimpse_full; \
	ls -d $(LOCALTOP)/src/*/*/*  | glimpseindex -F -H $(LOCALTOP)/src/.glimpse_full; \
	for  x in `ls -A1 .glimpse_full` ; do \
	  ln -s .glimpse_full/$$x $$x; \
	done; \
	rm .glimpse_filenames; cp .glimpse_full/.glimpse_filenames .glimpse_filenames; \
	sed -i -e 's|$(LOCALTOP)/src/||g' .glimpse_filenames
.PHONY: productmap
productmap:
	@cd $(LOCALTOP); \
	mkdir -p src; rm -f src/ReleaseProducts.list; echo ">> Generating Product Map in src/ReleaseProducts.list.";\
	(RelProducts.pl $(LOCALTOP) > $(LOCALTOP)/src/ReleaseProducts.list || exit 0)
.PHONY: depscheck
depscheck:
	@ReleaseDepsChecks.pl --detail
CONFIGDEPS += $(COMMON_WORKINGDIR)/cache/project_links
$(COMMON_WORKINGDIR)/cache/project_links: FORCE_TARGET
	@echo '>>Creating project symlinks';\
	[ -d $(@D) ] ||  $(CMD_mkdir) -p $(@D)
	@config/SCRAM/createSymLinks.pl src python 2 python '' -/LCG/;  \
	if [ ! -f $@ ] ; then touch $@; fi

PLUGIN_REFRESH_CMDS += RivetPluginRefres
define do_RivetPluginRefres
  echo "@@@@ Refreshing Plugins:RivetPluginRefres" &&\
RivetPluginRefres $(1)
endef
$(SCRAMSTORENAME_LIB)/.rivetcache: $(SCRAM_INTwork)/cache/rivet_RivetPluginRefres $(SCRAM_INTwork)/cache/prod/RivetPluginRefres
	@if [ -f $< ] ; then \
	  if [ -f $@ ] ; then \
	    if [ -s foo ] ; then \
	      touch -t 198001010100 $@ ;\
	    else \
	      rm -f $@ ; \
	    fi;\
	  fi;\
	  $(call do_RivetPluginRefres,$(@D)) &&\
	  touch $@ ;\
	fi
RivetPluginRefres_cache := $(SCRAMSTORENAME_LIB)/.rivetcache
$(SCRAM_INTwork)/cache/rivet_RivetPluginRefres: 
	@:
PLUGIN_REFRESH_CMDS += EdmPluginRefresh
define do_EdmPluginRefresh
  echo "@@@@ Refreshing Plugins:EdmPluginRefresh" &&\
EdmPluginRefresh $(1)
endef
$(SCRAMSTORENAME_LIB)/.edmplugincache: $(SCRAM_INTwork)/cache/edm_EdmPluginRefresh $(SCRAM_INTwork)/cache/prod/EdmPluginRefresh
	@if [ -f $< ] ; then \
	  if [ -f $@ ] ; then \
	    if [ -s foo ] ; then \
	      touch -t 198001010100 $@ ;\
	    else \
	      rm -f $@ ; \
	    fi;\
	  fi;\
	  $(call do_EdmPluginRefresh,$(@D)) &&\
	  touch $@ ;\
	fi
EdmPluginRefresh_cache := $(SCRAMSTORENAME_LIB)/.edmplugincache
$(SCRAM_INTwork)/cache/edm_EdmPluginRefresh: 
	@:
###############################################################################

