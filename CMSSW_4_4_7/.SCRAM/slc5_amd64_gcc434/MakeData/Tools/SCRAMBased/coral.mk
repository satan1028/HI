ifeq ($(strip $(CoralBase)),)
lcg_CoralBase := coral/CoralBase
CoralBase := lcg_CoralBase
lcg_CoralBase_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/CoralBase/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_CoralBase_LOC_USE   := coral boost boost_filesystem CoralBricks
lcg_CoralBase_EX_LIB   := lcg_CoralBase
lcg_CoralBase_EX_USE   := $(lcg_CoralBase_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_CoralBase
endif
ifeq ($(strip $(EnvironmentAuthenticationService)),)
lcg_EnvironmentAuthenticationService := coral/EnvironmentAuthenticationService
EnvironmentAuthenticationService := lcg_EnvironmentAuthenticationService
lcg_EnvironmentAuthenticationService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/EnvironmentAuthenticationService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_EnvironmentAuthenticationService_LOC_USE   := coral CoralCommon
lcg_EnvironmentAuthenticationService_EX_LIB   := lcg_EnvironmentAuthenticationService
lcg_EnvironmentAuthenticationService_EX_USE   := $(lcg_EnvironmentAuthenticationService_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_EnvironmentAuthenticationService
endif
ifeq ($(strip $(CoralKernel)),)
lcg_CoralKernel := coral/CoralKernel
CoralKernel := lcg_CoralKernel
lcg_CoralKernel_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/CoralKernel/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_CoralKernel_LOC_USE   := coral CoralBricks CoralBase
lcg_CoralKernel_EX_LIB   := lcg_CoralKernel
lcg_CoralKernel_EX_USE   := $(lcg_CoralKernel_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_CoralKernel
endif
ifeq ($(strip $(XMLLookupService)),)
lcg_XMLLookupService := coral/XMLLookupService
XMLLookupService := lcg_XMLLookupService
lcg_XMLLookupService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/XMLLookupService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_XMLLookupService_LOC_USE   := coral CoralCommon xerces-c
lcg_XMLLookupService_EX_LIB   := lcg_XMLLookupService
lcg_XMLLookupService_EX_USE   := $(lcg_XMLLookupService_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_XMLLookupService
endif
ifeq ($(strip $(SQLiteAccess)),)
lcg_SQLiteAccess := coral/SQLiteAccess
SQLiteAccess := lcg_SQLiteAccess
lcg_SQLiteAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/SQLiteAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_SQLiteAccess_LOC_USE   := coral CoralCommon sqlite
lcg_SQLiteAccess_EX_LIB   := lcg_SQLiteAccess
lcg_SQLiteAccess_EX_USE   := $(lcg_SQLiteAccess_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_SQLiteAccess
endif
ifeq ($(strip $(CoralCommon)),)
lcg_CoralCommon := coral/CoralCommon
CoralCommon := lcg_CoralCommon
lcg_CoralCommon_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/CoralCommon/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_CoralCommon_LOC_USE   := coral RelationalAccess xerces-c
lcg_CoralCommon_EX_LIB   := lcg_CoralCommon
lcg_CoralCommon_EX_USE   := $(lcg_CoralCommon_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_CoralCommon
endif
ifeq ($(strip $(PyCoral)),)
lcg_PyCoral := coral/PyCoral
PyCoral := lcg_PyCoral
lcg_PyCoral_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/PyCoral/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_PyCoral_LOC_USE   := coral RelationalAccess python
lcg_PyCoral_EX_LIB   := lcg_PyCoral
lcg_PyCoral_EX_USE   := $(lcg_PyCoral_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_PyCoral
endif
ifeq ($(strip $(ConnectionService)),)
lcg_ConnectionService := coral/ConnectionService
ConnectionService := lcg_ConnectionService
lcg_ConnectionService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/ConnectionService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_ConnectionService_LOC_USE   := coral uuid CoralCommon RelationalAccess boost
lcg_ConnectionService_EX_LIB   := lcg_ConnectionService
lcg_ConnectionService_EX_USE   := $(lcg_ConnectionService_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_ConnectionService
endif
ifeq ($(strip $(FrontierAccess)),)
lcg_FrontierAccess := coral/FrontierAccess
FrontierAccess := lcg_FrontierAccess
lcg_FrontierAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/FrontierAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_FrontierAccess_LOC_USE   := coral frontier_client openssl CoralCommon
lcg_FrontierAccess_EX_LIB   := lcg_FrontierAccess
lcg_FrontierAccess_EX_USE   := $(lcg_FrontierAccess_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_FrontierAccess
endif
ifeq ($(strip $(RelationalAccess)),)
lcg_RelationalAccess := coral/RelationalAccess
RelationalAccess := lcg_RelationalAccess
lcg_RelationalAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/RelationalAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_RelationalAccess_LOC_USE   := coral CoralBase CoralKernel
lcg_RelationalAccess_EX_LIB   := lcg_RelationalAccess
lcg_RelationalAccess_EX_USE   := $(lcg_RelationalAccess_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_RelationalAccess
endif
ifeq ($(strip $(OracleAccess)),)
lcg_OracleAccess := coral/OracleAccess
OracleAccess := lcg_OracleAccess
lcg_OracleAccess_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/OracleAccess/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_OracleAccess_LOC_USE   := coral CoralCommon oracle
lcg_OracleAccess_EX_LIB   := lcg_OracleAccess
lcg_OracleAccess_EX_USE   := $(lcg_OracleAccess_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_OracleAccess
endif
ifeq ($(strip $(RelationalService)),)
lcg_RelationalService := coral/RelationalService
RelationalService := lcg_RelationalService
lcg_RelationalService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/RelationalService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_RelationalService_LOC_USE   := coral CoralCommon boost
lcg_RelationalService_EX_LIB   := lcg_RelationalService
lcg_RelationalService_EX_USE   := $(lcg_RelationalService_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_RelationalService
endif
ifeq ($(strip $(MonitoringService)),)
lcg_MonitoringService := coral/MonitoringService
MonitoringService := lcg_MonitoringService
lcg_MonitoringService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/MonitoringService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_MonitoringService_LOC_USE   := coral CoralCommon
lcg_MonitoringService_EX_LIB   := lcg_MonitoringService
lcg_MonitoringService_EX_USE   := $(lcg_MonitoringService_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_MonitoringService
endif
ifeq ($(strip $(XMLAuthenticationService)),)
lcg_XMLAuthenticationService := coral/XMLAuthenticationService
XMLAuthenticationService := lcg_XMLAuthenticationService
lcg_XMLAuthenticationService_BuildFile    := $(wildcard $(WORKINGDIR)/cache/bf/src/XMLAuthenticationService/BuildFile) /cvmfs/cms.cern.ch/slc5_amd64_gcc434/cms/coral/CORAL_2_3_12-cms60/.SCRAM/$(SCRAM_ARCH)/MakeData/DirCache.mk
lcg_XMLAuthenticationService_LOC_USE   := coral CoralCommon xerces-c
lcg_XMLAuthenticationService_EX_LIB   := lcg_XMLAuthenticationService
lcg_XMLAuthenticationService_EX_USE   := $(lcg_XMLAuthenticationService_LOC_USE)
ALL_EXTERNAL_PRODS += lcg_XMLAuthenticationService
endif
