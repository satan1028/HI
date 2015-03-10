ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Appeltel)
subdirs_src_Appeltel = src_Appeltel_RpPbAnalysis
ALL_PACKAGES += $(patsubst src/%,%,src/Appeltel/RpPbAnalysis)
subdirs_src_Appeltel_RpPbAnalysis := src_Appeltel_RpPbAnalysis_macros src_Appeltel_RpPbAnalysis_python src_Appeltel_RpPbAnalysis_scripts src_Appeltel_RpPbAnalysis_src src_Appeltel_RpPbAnalysis_test
ifeq ($(strip $(PyAppeltelRpPbAnalysis)),)
PyAppeltelRpPbAnalysis := self/src/Appeltel/RpPbAnalysis/python
src_Appeltel_RpPbAnalysis_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Appeltel/RpPbAnalysis/python)
PyAppeltelRpPbAnalysis_files := $(patsubst src/Appeltel/RpPbAnalysis/python/%,%,$(wildcard $(foreach dir,src/Appeltel/RpPbAnalysis/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyAppeltelRpPbAnalysis_LOC_USE := self  
PyAppeltelRpPbAnalysis_PACKAGE := self/src/Appeltel/RpPbAnalysis/python
ALL_PRODS += PyAppeltelRpPbAnalysis
PyAppeltelRpPbAnalysis_INIT_FUNC        += $$(eval $$(call PythonProduct,PyAppeltelRpPbAnalysis,src/Appeltel/RpPbAnalysis/python,src_Appeltel_RpPbAnalysis_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyAppeltelRpPbAnalysis,src/Appeltel/RpPbAnalysis/python))
endif
ALL_COMMONRULES += src_Appeltel_RpPbAnalysis_python
src_Appeltel_RpPbAnalysis_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Appeltel_RpPbAnalysis_python,src/Appeltel/RpPbAnalysis/python,PYTHON))
src_Appeltel_RpPbAnalysis_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/Appeltel/RpPbAnalysis/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_Appeltel_RpPbAnalysis_scripts,src/Appeltel/RpPbAnalysis/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(Appeltel/RpPbAnalysis)),)
ALL_COMMONRULES += src_Appeltel_RpPbAnalysis_src
src_Appeltel_RpPbAnalysis_src_parent := Appeltel/RpPbAnalysis
src_Appeltel_RpPbAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Appeltel_RpPbAnalysis_src,src/Appeltel/RpPbAnalysis/src,LIBRARY))
AppeltelRpPbAnalysis := self/Appeltel/RpPbAnalysis
Appeltel/RpPbAnalysis := AppeltelRpPbAnalysis
AppeltelRpPbAnalysis_files := $(patsubst src/Appeltel/RpPbAnalysis/src/%,%,$(wildcard $(foreach dir,src/Appeltel/RpPbAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
AppeltelRpPbAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/Appeltel/RpPbAnalysis/BuildFile
AppeltelRpPbAnalysis_LOC_USE := self  hepmc FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math DataFormats/Scalers Geometry/TrackerGeometryBuilder SimTracker/Records SimTracker/TrackAssociation SimTracker/TrackHistory SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord
AppeltelRpPbAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,AppeltelRpPbAnalysis,AppeltelRpPbAnalysis,$(SCRAMSTORENAME_LIB),src/Appeltel/RpPbAnalysis/src))
AppeltelRpPbAnalysis_PACKAGE := self/src/Appeltel/RpPbAnalysis/src
ALL_PRODS += AppeltelRpPbAnalysis
AppeltelRpPbAnalysis_INIT_FUNC        += $$(eval $$(call Library,AppeltelRpPbAnalysis,src/Appeltel/RpPbAnalysis/src,src_Appeltel_RpPbAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_Appeltel_RpPbAnalysis_test
src_Appeltel_RpPbAnalysis_test_parent := Appeltel/RpPbAnalysis
src_Appeltel_RpPbAnalysis_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Appeltel_RpPbAnalysis_test,src/Appeltel/RpPbAnalysis/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/DataFormats)
subdirs_src_DataFormats = src_DataFormats_HeavyIonEvent
ALL_PACKAGES += $(patsubst src/%,%,src/DataFormats/HeavyIonEvent)
subdirs_src_DataFormats_HeavyIonEvent := src_DataFormats_HeavyIonEvent_doc src_DataFormats_HeavyIonEvent_interface src_DataFormats_HeavyIonEvent_src
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/EffAna)
subdirs_src_EffAna = src_EffAna_AnaEff src_EffAna_ESAnaEff
ALL_PACKAGES += $(patsubst src/%,%,src/EffAna/AnaEff)
subdirs_src_EffAna_AnaEff := src_EffAna_AnaEff_src src_EffAna_AnaEff_test src_EffAna_AnaEff_python
ifeq ($(strip $(PyEffAnaAnaEff)),)
PyEffAnaAnaEff := self/src/EffAna/AnaEff/python
src_EffAna_AnaEff_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/EffAna/AnaEff/python)
PyEffAnaAnaEff_files := $(patsubst src/EffAna/AnaEff/python/%,%,$(wildcard $(foreach dir,src/EffAna/AnaEff/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyEffAnaAnaEff_LOC_USE := self  
PyEffAnaAnaEff_PACKAGE := self/src/EffAna/AnaEff/python
ALL_PRODS += PyEffAnaAnaEff
PyEffAnaAnaEff_INIT_FUNC        += $$(eval $$(call PythonProduct,PyEffAnaAnaEff,src/EffAna/AnaEff/python,src_EffAna_AnaEff_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyEffAnaAnaEff,src/EffAna/AnaEff/python))
endif
ALL_COMMONRULES += src_EffAna_AnaEff_python
src_EffAna_AnaEff_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_AnaEff_python,src/EffAna/AnaEff/python,PYTHON))
ifeq ($(strip $(EffAna/AnaEff)),)
ALL_COMMONRULES += src_EffAna_AnaEff_src
src_EffAna_AnaEff_src_parent := EffAna/AnaEff
src_EffAna_AnaEff_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_EffAna_AnaEff_src,src/EffAna/AnaEff/src,LIBRARY))
EffAnaAnaEff := self/EffAna/AnaEff
EffAna/AnaEff := EffAnaAnaEff
EffAnaAnaEff_files := $(patsubst src/EffAna/AnaEff/src/%,%,$(wildcard $(foreach dir,src/EffAna/AnaEff/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
EffAnaAnaEff_BuildFile    := $(WORKINGDIR)/cache/bf/src/EffAna/AnaEff/BuildFile
EffAnaAnaEff_LOC_USE := self  FWCore/PluginManager FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger FWCore/ServiceRegistry FWCore/Common root boost heppdt CommonTools/UtilAlgos DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/HcalDigi DataFormats/JetReco DataFormats/FEDRawData DataFormats/HeavyIonEvent DataFormats/VertexReco DataFormats/TrackReco CondFormats/CastorObjects CalibFormats/CastorObjects EventFilter/CastorRawToDigi Geometry/CaloGeometry SimDataFormats/HiGenData SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord rootmath
EffAnaAnaEff_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,EffAnaAnaEff,EffAnaAnaEff,$(SCRAMSTORENAME_LIB),src/EffAna/AnaEff/src))
EffAnaAnaEff_PACKAGE := self/src/EffAna/AnaEff/src
ALL_PRODS += EffAnaAnaEff
EffAnaAnaEff_INIT_FUNC        += $$(eval $$(call Library,EffAnaAnaEff,src/EffAna/AnaEff/src,src_EffAna_AnaEff_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_EffAna_AnaEff_test
src_EffAna_AnaEff_test_parent := EffAna/AnaEff
src_EffAna_AnaEff_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_AnaEff_test,src/EffAna/AnaEff/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/EffAna/ESAnaEff)
subdirs_src_EffAna_ESAnaEff := src_EffAna_ESAnaEff_interface src_EffAna_ESAnaEff_src src_EffAna_ESAnaEff_test src_EffAna_ESAnaEff_python
ifeq ($(strip $(PyEffAnaESAnaEff)),)
PyEffAnaESAnaEff := self/src/EffAna/ESAnaEff/python
src_EffAna_ESAnaEff_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/EffAna/ESAnaEff/python)
PyEffAnaESAnaEff_files := $(patsubst src/EffAna/ESAnaEff/python/%,%,$(wildcard $(foreach dir,src/EffAna/ESAnaEff/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyEffAnaESAnaEff_LOC_USE := self  
PyEffAnaESAnaEff_PACKAGE := self/src/EffAna/ESAnaEff/python
ALL_PRODS += PyEffAnaESAnaEff
PyEffAnaESAnaEff_INIT_FUNC        += $$(eval $$(call PythonProduct,PyEffAnaESAnaEff,src/EffAna/ESAnaEff/python,src_EffAna_ESAnaEff_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyEffAnaESAnaEff,src/EffAna/ESAnaEff/python))
endif
ALL_COMMONRULES += src_EffAna_ESAnaEff_python
src_EffAna_ESAnaEff_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_ESAnaEff_python,src/EffAna/ESAnaEff/python,PYTHON))
ifeq ($(strip $(EffAna/ESAnaEff)),)
ALL_COMMONRULES += src_EffAna_ESAnaEff_src
src_EffAna_ESAnaEff_src_parent := EffAna/ESAnaEff
src_EffAna_ESAnaEff_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_EffAna_ESAnaEff_src,src/EffAna/ESAnaEff/src,LIBRARY))
EffAnaESAnaEff := self/EffAna/ESAnaEff
EffAna/ESAnaEff := EffAnaESAnaEff
EffAnaESAnaEff_files := $(patsubst src/EffAna/ESAnaEff/src/%,%,$(wildcard $(foreach dir,src/EffAna/ESAnaEff/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
EffAnaESAnaEff_BuildFile    := $(WORKINGDIR)/cache/bf/src/EffAna/ESAnaEff/BuildFile
EffAnaESAnaEff_LOC_USE := self  FWCore/PluginManager FWCore/ParameterSet FWCore/Framework FWCore/MessageLogger FWCore/ServiceRegistry FWCore/Common root boost heppdt CommonTools/UtilAlgos DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/HcalDigi DataFormats/JetReco DataFormats/FEDRawData DataFormats/HeavyIonEvent DataFormats/VertexReco DataFormats/TrackReco CondFormats/CastorObjects CalibFormats/CastorObjects EventFilter/CastorRawToDigi Geometry/CaloGeometry SimDataFormats/HiGenData SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimGeneral/HepPDTRecord rootmath
EffAnaESAnaEff_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,EffAnaESAnaEff,EffAnaESAnaEff,$(SCRAMSTORENAME_LIB),src/EffAna/ESAnaEff/src))
EffAnaESAnaEff_PACKAGE := self/src/EffAna/ESAnaEff/src
ALL_PRODS += EffAnaESAnaEff
EffAnaESAnaEff_INIT_FUNC        += $$(eval $$(call Library,EffAnaESAnaEff,src/EffAna/ESAnaEff/src,src_EffAna_ESAnaEff_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_EffAna_ESAnaEff_test
src_EffAna_ESAnaEff_test_parent := EffAna/ESAnaEff
src_EffAna_ESAnaEff_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_EffAna_ESAnaEff_test,src/EffAna/ESAnaEff/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/GeneratorInterface)
subdirs_src_GeneratorInterface = src_GeneratorInterface_HijingInterface src_GeneratorInterface_AnaHijing
ALL_PACKAGES += $(patsubst src/%,%,src/GeneratorInterface/AnaHijing)
subdirs_src_GeneratorInterface_AnaHijing := src_GeneratorInterface_AnaHijing_src src_GeneratorInterface_AnaHijing_test src_GeneratorInterface_AnaHijing_doc src_GeneratorInterface_AnaHijing_python
ifeq ($(strip $(PyGeneratorInterfaceAnaHijing)),)
PyGeneratorInterfaceAnaHijing := self/src/GeneratorInterface/AnaHijing/python
src_GeneratorInterface_AnaHijing_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/GeneratorInterface/AnaHijing/python)
PyGeneratorInterfaceAnaHijing_files := $(patsubst src/GeneratorInterface/AnaHijing/python/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/AnaHijing/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyGeneratorInterfaceAnaHijing_LOC_USE := self  
PyGeneratorInterfaceAnaHijing_PACKAGE := self/src/GeneratorInterface/AnaHijing/python
ALL_PRODS += PyGeneratorInterfaceAnaHijing
PyGeneratorInterfaceAnaHijing_INIT_FUNC        += $$(eval $$(call PythonProduct,PyGeneratorInterfaceAnaHijing,src/GeneratorInterface/AnaHijing/python,src_GeneratorInterface_AnaHijing_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyGeneratorInterfaceAnaHijing,src/GeneratorInterface/AnaHijing/python))
endif
ALL_COMMONRULES += src_GeneratorInterface_AnaHijing_python
src_GeneratorInterface_AnaHijing_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_AnaHijing_python,src/GeneratorInterface/AnaHijing/python,PYTHON))
ifeq ($(strip $(GeneratorInterface/AnaHijing)),)
ALL_COMMONRULES += src_GeneratorInterface_AnaHijing_src
src_GeneratorInterface_AnaHijing_src_parent := GeneratorInterface/AnaHijing
src_GeneratorInterface_AnaHijing_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_GeneratorInterface_AnaHijing_src,src/GeneratorInterface/AnaHijing/src,LIBRARY))
GeneratorInterfaceAnaHijing := self/GeneratorInterface/AnaHijing
GeneratorInterface/AnaHijing := GeneratorInterfaceAnaHijing
GeneratorInterfaceAnaHijing_files := $(patsubst src/GeneratorInterface/AnaHijing/src/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/AnaHijing/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
GeneratorInterfaceAnaHijing_BuildFile    := $(WORKINGDIR)/cache/bf/src/GeneratorInterface/AnaHijing/BuildFile
GeneratorInterfaceAnaHijing_LOC_USE := self  boost root heppdt FWCore/Framework FWCore/PluginManager FWCore/ParameterSet SimDataFormats/Vertex SimDataFormats/GeneratorProducts SimDataFormats/HiGenData SimGeneral/HepPDTRecord CommonTools/UtilAlgos FWCore/ServiceRegistry FWCore/Utilities
GeneratorInterfaceAnaHijing_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,GeneratorInterfaceAnaHijing,GeneratorInterfaceAnaHijing,$(SCRAMSTORENAME_LIB),src/GeneratorInterface/AnaHijing/src))
GeneratorInterfaceAnaHijing_PACKAGE := self/src/GeneratorInterface/AnaHijing/src
ALL_PRODS += GeneratorInterfaceAnaHijing
GeneratorInterfaceAnaHijing_INIT_FUNC        += $$(eval $$(call Library,GeneratorInterfaceAnaHijing,src/GeneratorInterface/AnaHijing/src,src_GeneratorInterface_AnaHijing_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_GeneratorInterface_AnaHijing_test
src_GeneratorInterface_AnaHijing_test_parent := GeneratorInterface/AnaHijing
src_GeneratorInterface_AnaHijing_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_AnaHijing_test,src/GeneratorInterface/AnaHijing/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/GeneratorInterface/HijingInterface)
subdirs_src_GeneratorInterface_HijingInterface := src_GeneratorInterface_HijingInterface_doc src_GeneratorInterface_HijingInterface_interface src_GeneratorInterface_HijingInterface_plugins src_GeneratorInterface_HijingInterface_python src_GeneratorInterface_HijingInterface_src src_GeneratorInterface_HijingInterface_test src_GeneratorInterface_HijingInterface_genAna
ifeq ($(strip $(GeneratorInterfaceHijingInterfacePlugins)),)
GeneratorInterfaceHijingInterfacePlugins_files := $(patsubst src/GeneratorInterface/HijingInterface/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/GeneratorInterface/HijingInterface/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/GeneratorInterface/HijingInterface/plugins/$(file). Please fix src/GeneratorInterface/HijingInterface/plugins/BuildFile.))))
GeneratorInterfaceHijingInterfacePlugins := self/src/GeneratorInterface/HijingInterface/plugins
GeneratorInterfaceHijingInterfacePlugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/GeneratorInterface/HijingInterface/plugins/BuildFile
GeneratorInterfaceHijingInterfacePlugins_LOC_USE := self  GeneratorInterface/HijingInterface
GeneratorInterfaceHijingInterfacePlugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,GeneratorInterfaceHijingInterfacePlugins,GeneratorInterfaceHijingInterfacePlugins,$(SCRAMSTORENAME_LIB),src/GeneratorInterface/HijingInterface/plugins))
GeneratorInterfaceHijingInterfacePlugins_PACKAGE := self/src/GeneratorInterface/HijingInterface/plugins
ALL_PRODS += GeneratorInterfaceHijingInterfacePlugins
GeneratorInterfaceHijingInterfacePlugins_INIT_FUNC        += $$(eval $$(call Library,GeneratorInterfaceHijingInterfacePlugins,src/GeneratorInterface/HijingInterface/plugins,src_GeneratorInterface_HijingInterface_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,GeneratorInterfaceHijingInterfacePlugins,src/GeneratorInterface/HijingInterface/plugins))
endif
ALL_COMMONRULES += src_GeneratorInterface_HijingInterface_plugins
src_GeneratorInterface_HijingInterface_plugins_parent := GeneratorInterface/HijingInterface
src_GeneratorInterface_HijingInterface_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_HijingInterface_plugins,src/GeneratorInterface/HijingInterface/plugins,PLUGINS))
ifeq ($(strip $(PyGeneratorInterfaceHijingInterface)),)
PyGeneratorInterfaceHijingInterface := self/src/GeneratorInterface/HijingInterface/python
src_GeneratorInterface_HijingInterface_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/GeneratorInterface/HijingInterface/python)
PyGeneratorInterfaceHijingInterface_files := $(patsubst src/GeneratorInterface/HijingInterface/python/%,%,$(wildcard $(foreach dir,src/GeneratorInterface/HijingInterface/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyGeneratorInterfaceHijingInterface_LOC_USE := self  
PyGeneratorInterfaceHijingInterface_PACKAGE := self/src/GeneratorInterface/HijingInterface/python
ALL_PRODS += PyGeneratorInterfaceHijingInterface
PyGeneratorInterfaceHijingInterface_INIT_FUNC        += $$(eval $$(call PythonProduct,PyGeneratorInterfaceHijingInterface,src/GeneratorInterface/HijingInterface/python,src_GeneratorInterface_HijingInterface_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyGeneratorInterfaceHijingInterface,src/GeneratorInterface/HijingInterface/python))
endif
ALL_COMMONRULES += src_GeneratorInterface_HijingInterface_python
src_GeneratorInterface_HijingInterface_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_HijingInterface_python,src/GeneratorInterface/HijingInterface/python,PYTHON))
ALL_COMMONRULES += src_GeneratorInterface_HijingInterface_test
src_GeneratorInterface_HijingInterface_test_parent := GeneratorInterface/HijingInterface
src_GeneratorInterface_HijingInterface_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_GeneratorInterface_HijingInterface_test,src/GeneratorInterface/HijingInterface/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/HeavyIonsAnalysis)
subdirs_src_HeavyIonsAnalysis = src_HeavyIonsAnalysis_Configuration
ALL_PACKAGES += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration)
subdirs_src_HeavyIonsAnalysis_Configuration := src_HeavyIonsAnalysis_Configuration_data src_HeavyIonsAnalysis_Configuration_python src_HeavyIonsAnalysis_Configuration_test
ifeq ($(strip $(PyHeavyIonsAnalysisConfiguration)),)
PyHeavyIonsAnalysisConfiguration := self/src/HeavyIonsAnalysis/Configuration/python
src_HeavyIonsAnalysis_Configuration_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration/python)
PyHeavyIonsAnalysisConfiguration_files := $(patsubst src/HeavyIonsAnalysis/Configuration/python/%,%,$(wildcard $(foreach dir,src/HeavyIonsAnalysis/Configuration/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyHeavyIonsAnalysisConfiguration_LOC_USE := self  
PyHeavyIonsAnalysisConfiguration_PACKAGE := self/src/HeavyIonsAnalysis/Configuration/python
ALL_PRODS += PyHeavyIonsAnalysisConfiguration
PyHeavyIonsAnalysisConfiguration_INIT_FUNC        += $$(eval $$(call PythonProduct,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python,src_HeavyIonsAnalysis_Configuration_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyHeavyIonsAnalysisConfiguration,src/HeavyIonsAnalysis/Configuration/python))
endif
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_python
src_HeavyIonsAnalysis_Configuration_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_python,src/HeavyIonsAnalysis/Configuration/python,PYTHON))
ALL_COMMONRULES += src_HeavyIonsAnalysis_Configuration_test
src_HeavyIonsAnalysis_Configuration_test_parent := HeavyIonsAnalysis/Configuration
src_HeavyIonsAnalysis_Configuration_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_HeavyIonsAnalysis_Configuration_test,src/HeavyIonsAnalysis/Configuration/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoHI)
subdirs_src_RecoHI = src_RecoHI_HiCentralityAlgos
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos)
subdirs_src_RecoHI_HiCentralityAlgos := src_RecoHI_HiCentralityAlgos_data src_RecoHI_HiCentralityAlgos_doc src_RecoHI_HiCentralityAlgos_macros src_RecoHI_HiCentralityAlgos_python src_RecoHI_HiCentralityAlgos_src src_RecoHI_HiCentralityAlgos_test src_RecoHI_HiCentralityAlgos_tools
ifeq ($(strip $(PyRecoHIHiCentralityAlgos)),)
PyRecoHIHiCentralityAlgos := self/src/RecoHI/HiCentralityAlgos/python
src_RecoHI_HiCentralityAlgos_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos/python)
PyRecoHIHiCentralityAlgos_files := $(patsubst src/RecoHI/HiCentralityAlgos/python/%,%,$(wildcard $(foreach dir,src/RecoHI/HiCentralityAlgos/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoHIHiCentralityAlgos_LOC_USE := self  
PyRecoHIHiCentralityAlgos_PACKAGE := self/src/RecoHI/HiCentralityAlgos/python
ALL_PRODS += PyRecoHIHiCentralityAlgos
PyRecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python,src_RecoHI_HiCentralityAlgos_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/python))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_python
src_RecoHI_HiCentralityAlgos_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_python,src/RecoHI/HiCentralityAlgos/python,PYTHON))
ifeq ($(strip $(RecoHI/HiCentralityAlgos)),)
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_src
src_RecoHI_HiCentralityAlgos_src_parent := RecoHI/HiCentralityAlgos
src_RecoHI_HiCentralityAlgos_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_src,src/RecoHI/HiCentralityAlgos/src,LIBRARY))
RecoHIHiCentralityAlgos := self/RecoHI/HiCentralityAlgos
RecoHI/HiCentralityAlgos := RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_files := $(patsubst src/RecoHI/HiCentralityAlgos/src/%,%,$(wildcard $(foreach dir,src/RecoHI/HiCentralityAlgos/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
RecoHIHiCentralityAlgos_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiCentralityAlgos/BuildFile
RecoHIHiCentralityAlgos_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/Common DataFormats/HeavyIonEvent DataFormats/TrackingRecHit DataFormats/TrackerRecHit2D DataFormats/TrackReco DataFormats/VertexReco CondFormats/HIObjects CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService CondCore/PopCon Geometry/CaloGeometry Geometry/TrackerGeometryBuilder
RecoHIHiCentralityAlgos_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,RecoHIHiCentralityAlgos,RecoHIHiCentralityAlgos,$(SCRAMSTORENAME_LIB),src/RecoHI/HiCentralityAlgos/src))
RecoHIHiCentralityAlgos_PACKAGE := self/src/RecoHI/HiCentralityAlgos/src
ALL_PRODS += RecoHIHiCentralityAlgos
RecoHIHiCentralityAlgos_INIT_FUNC        += $$(eval $$(call Library,RecoHIHiCentralityAlgos,src/RecoHI/HiCentralityAlgos/src,src_RecoHI_HiCentralityAlgos_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ifeq ($(strip $(AnalyzerWithCentrality)),)
AnalyzerWithCentrality_files := $(patsubst src/RecoHI/HiCentralityAlgos/test/%,%,$(foreach file,AnalyzerWithCentrality.cc,$(eval xfile:=$(wildcard src/RecoHI/HiCentralityAlgos/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoHI/HiCentralityAlgos/test/$(file). Please fix src/RecoHI/HiCentralityAlgos/test/BuildFile.))))
AnalyzerWithCentrality := self/src/RecoHI/HiCentralityAlgos/test
AnalyzerWithCentrality_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoHI/HiCentralityAlgos/test/BuildFile
AnalyzerWithCentrality_LOC_USE := self  root rootrflx FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/Utilities CommonTools/UtilAlgos DataFormats/Candidate DataFormats/HcalRecHit DataFormats/Common DataFormats/HeavyIonEvent CondFormats/HIObjects CondFormats/DataRecord CondCore/DBCommon CondCore/DBOutputService
AnalyzerWithCentrality_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,AnalyzerWithCentrality,AnalyzerWithCentrality,$(SCRAMSTORENAME_LIB),src/RecoHI/HiCentralityAlgos/test))
AnalyzerWithCentrality_PACKAGE := self/src/RecoHI/HiCentralityAlgos/test
ALL_PRODS += AnalyzerWithCentrality
AnalyzerWithCentrality_INIT_FUNC        += $$(eval $$(call Library,AnalyzerWithCentrality,src/RecoHI/HiCentralityAlgos/test,src_RecoHI_HiCentralityAlgos_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,AnalyzerWithCentrality,src/RecoHI/HiCentralityAlgos/test))
endif
ALL_COMMONRULES += src_RecoHI_HiCentralityAlgos_test
src_RecoHI_HiCentralityAlgos_test_parent := RecoHI/HiCentralityAlgos
src_RecoHI_HiCentralityAlgos_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoHI_HiCentralityAlgos_test,src/RecoHI/HiCentralityAlgos/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Tutorial)
subdirs_src_Tutorial = src_Tutorial_ExampleGenAnalyzer
ALL_PACKAGES += $(patsubst src/%,%,src/Tutorial/ExampleGenAnalyzer)
subdirs_src_Tutorial_ExampleGenAnalyzer := src_Tutorial_ExampleGenAnalyzer_src src_Tutorial_ExampleGenAnalyzer_test src_Tutorial_ExampleGenAnalyzer_python
ifeq ($(strip $(PyTutorialExampleGenAnalyzer)),)
PyTutorialExampleGenAnalyzer := self/src/Tutorial/ExampleGenAnalyzer/python
src_Tutorial_ExampleGenAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Tutorial/ExampleGenAnalyzer/python)
PyTutorialExampleGenAnalyzer_files := $(patsubst src/Tutorial/ExampleGenAnalyzer/python/%,%,$(wildcard $(foreach dir,src/Tutorial/ExampleGenAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyTutorialExampleGenAnalyzer_LOC_USE := self  
PyTutorialExampleGenAnalyzer_PACKAGE := self/src/Tutorial/ExampleGenAnalyzer/python
ALL_PRODS += PyTutorialExampleGenAnalyzer
PyTutorialExampleGenAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyTutorialExampleGenAnalyzer,src/Tutorial/ExampleGenAnalyzer/python,src_Tutorial_ExampleGenAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyTutorialExampleGenAnalyzer,src/Tutorial/ExampleGenAnalyzer/python))
endif
ALL_COMMONRULES += src_Tutorial_ExampleGenAnalyzer_python
src_Tutorial_ExampleGenAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Tutorial_ExampleGenAnalyzer_python,src/Tutorial/ExampleGenAnalyzer/python,PYTHON))
ifeq ($(strip $(Tutorial/ExampleGenAnalyzer)),)
ALL_COMMONRULES += src_Tutorial_ExampleGenAnalyzer_src
src_Tutorial_ExampleGenAnalyzer_src_parent := Tutorial/ExampleGenAnalyzer
src_Tutorial_ExampleGenAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_Tutorial_ExampleGenAnalyzer_src,src/Tutorial/ExampleGenAnalyzer/src,LIBRARY))
TutorialExampleGenAnalyzer := self/Tutorial/ExampleGenAnalyzer
Tutorial/ExampleGenAnalyzer := TutorialExampleGenAnalyzer
TutorialExampleGenAnalyzer_files := $(patsubst src/Tutorial/ExampleGenAnalyzer/src/%,%,$(wildcard $(foreach dir,src/Tutorial/ExampleGenAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
TutorialExampleGenAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/Tutorial/ExampleGenAnalyzer/BuildFile
TutorialExampleGenAnalyzer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/JetReco FWCore/ServiceRegistry CommonTools/UtilAlgos SimDataFormats/GeneratorProducts SimDataFormats/JetMatching DataFormats/HepMCCandidate SimGeneral/HepPDTRecord hepmc
TutorialExampleGenAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,TutorialExampleGenAnalyzer,TutorialExampleGenAnalyzer,$(SCRAMSTORENAME_LIB),src/Tutorial/ExampleGenAnalyzer/src))
TutorialExampleGenAnalyzer_PACKAGE := self/src/Tutorial/ExampleGenAnalyzer/src
ALL_PRODS += TutorialExampleGenAnalyzer
TutorialExampleGenAnalyzer_INIT_FUNC        += $$(eval $$(call Library,TutorialExampleGenAnalyzer,src/Tutorial/ExampleGenAnalyzer/src,src_Tutorial_ExampleGenAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_Tutorial_ExampleGenAnalyzer_test
src_Tutorial_ExampleGenAnalyzer_test_parent := Tutorial/ExampleGenAnalyzer
src_Tutorial_ExampleGenAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Tutorial_ExampleGenAnalyzer_test,src/Tutorial/ExampleGenAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/V0Eff)
subdirs_src_V0Eff = src_V0Eff_V0DeltaREffAnalyzer
ALL_PACKAGES += $(patsubst src/%,%,src/V0Eff/V0DeltaREffAnalyzer)
subdirs_src_V0Eff_V0DeltaREffAnalyzer := src_V0Eff_V0DeltaREffAnalyzer_python src_V0Eff_V0DeltaREffAnalyzer_src src_V0Eff_V0DeltaREffAnalyzer_test
ifeq ($(strip $(PyV0EffV0DeltaREffAnalyzer)),)
PyV0EffV0DeltaREffAnalyzer := self/src/V0Eff/V0DeltaREffAnalyzer/python
src_V0Eff_V0DeltaREffAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/V0Eff/V0DeltaREffAnalyzer/python)
PyV0EffV0DeltaREffAnalyzer_files := $(patsubst src/V0Eff/V0DeltaREffAnalyzer/python/%,%,$(wildcard $(foreach dir,src/V0Eff/V0DeltaREffAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyV0EffV0DeltaREffAnalyzer_LOC_USE := self  
PyV0EffV0DeltaREffAnalyzer_PACKAGE := self/src/V0Eff/V0DeltaREffAnalyzer/python
ALL_PRODS += PyV0EffV0DeltaREffAnalyzer
PyV0EffV0DeltaREffAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyV0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/python,src_V0Eff_V0DeltaREffAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyV0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/python))
endif
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_python
src_V0Eff_V0DeltaREffAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_python,src/V0Eff/V0DeltaREffAnalyzer/python,PYTHON))
ifeq ($(strip $(V0Eff/V0DeltaREffAnalyzer)),)
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_src
src_V0Eff_V0DeltaREffAnalyzer_src_parent := V0Eff/V0DeltaREffAnalyzer
src_V0Eff_V0DeltaREffAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_src,src/V0Eff/V0DeltaREffAnalyzer/src,LIBRARY))
V0EffV0DeltaREffAnalyzer := self/V0Eff/V0DeltaREffAnalyzer
V0Eff/V0DeltaREffAnalyzer := V0EffV0DeltaREffAnalyzer
V0EffV0DeltaREffAnalyzer_files := $(patsubst src/V0Eff/V0DeltaREffAnalyzer/src/%,%,$(wildcard $(foreach dir,src/V0Eff/V0DeltaREffAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
V0EffV0DeltaREffAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/V0Eff/V0DeltaREffAnalyzer/BuildFile
V0EffV0DeltaREffAnalyzer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/GeometryVector DataFormats/TrackReco DataFormats/VertexReco DataFormats/PatCandidates DataFormats/RecoCandidate DataFormats/BeamSpot SimDataFormats/GeneratorProducts DataFormats/Candidate DataFormats/HepMCCandidate DataFormats/Math RecoVertex/KinematicFit RecoVertex/KinematicFitPrimitives RecoVertex/AdaptiveVertexFit TrackingTools/IPTools TrackingTools/TransientTrack TrackingTools/Records TrackingTools/PatternTools TrackingTools/TrajectoryState MagneticField/Engine MagneticField/Records DataFormats/L1GlobalTrigger DataFormats/HcalDetId CondFormats/L1TObjects CondFormats/DataRecord root
V0EffV0DeltaREffAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,V0EffV0DeltaREffAnalyzer,V0EffV0DeltaREffAnalyzer,$(SCRAMSTORENAME_LIB),src/V0Eff/V0DeltaREffAnalyzer/src))
V0EffV0DeltaREffAnalyzer_PACKAGE := self/src/V0Eff/V0DeltaREffAnalyzer/src
ALL_PRODS += V0EffV0DeltaREffAnalyzer
V0EffV0DeltaREffAnalyzer_INIT_FUNC        += $$(eval $$(call Library,V0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/src,src_V0Eff_V0DeltaREffAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_test
src_V0Eff_V0DeltaREffAnalyzer_test_parent := V0Eff/V0DeltaREffAnalyzer
src_V0Eff_V0DeltaREffAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_test,src/V0Eff/V0DeltaREffAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/V0Scripts)
subdirs_src_V0Scripts = src_V0Scripts_finalMassPlots src_V0Scripts_final_plots
ALL_PACKAGES += $(patsubst src/%,%,src/V0Scripts/finalMassPlots)
subdirs_src_V0Scripts_finalMassPlots := 
ALL_PACKAGES += $(patsubst src/%,%,src/V0Scripts/final_plots)
subdirs_src_V0Scripts_final_plots := 
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/dNchdeta)
subdirs_src_dNchdeta = src_dNchdeta_PythiaMC
ALL_PACKAGES += $(patsubst src/%,%,src/dNchdeta/PythiaMC)
subdirs_src_dNchdeta_PythiaMC := src_dNchdeta_PythiaMC_python src_dNchdeta_PythiaMC_src src_dNchdeta_PythiaMC_test
ifeq ($(strip $(PydNchdetaPythiaMC)),)
PydNchdetaPythiaMC := self/src/dNchdeta/PythiaMC/python
src_dNchdeta_PythiaMC_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/dNchdeta/PythiaMC/python)
PydNchdetaPythiaMC_files := $(patsubst src/dNchdeta/PythiaMC/python/%,%,$(wildcard $(foreach dir,src/dNchdeta/PythiaMC/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PydNchdetaPythiaMC_LOC_USE := self  
PydNchdetaPythiaMC_PACKAGE := self/src/dNchdeta/PythiaMC/python
ALL_PRODS += PydNchdetaPythiaMC
PydNchdetaPythiaMC_INIT_FUNC        += $$(eval $$(call PythonProduct,PydNchdetaPythiaMC,src/dNchdeta/PythiaMC/python,src_dNchdeta_PythiaMC_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PydNchdetaPythiaMC,src/dNchdeta/PythiaMC/python))
endif
ALL_COMMONRULES += src_dNchdeta_PythiaMC_python
src_dNchdeta_PythiaMC_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_dNchdeta_PythiaMC_python,src/dNchdeta/PythiaMC/python,PYTHON))
ifeq ($(strip $(dNchdeta/PythiaMC)),)
ALL_COMMONRULES += src_dNchdeta_PythiaMC_src
src_dNchdeta_PythiaMC_src_parent := dNchdeta/PythiaMC
src_dNchdeta_PythiaMC_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_dNchdeta_PythiaMC_src,src/dNchdeta/PythiaMC/src,LIBRARY))
dNchdetaPythiaMC := self/dNchdeta/PythiaMC
dNchdeta/PythiaMC := dNchdetaPythiaMC
dNchdetaPythiaMC_files := $(patsubst src/dNchdeta/PythiaMC/src/%,%,$(wildcard $(foreach dir,src/dNchdeta/PythiaMC/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
dNchdetaPythiaMC_BuildFile    := $(WORKINGDIR)/cache/bf/src/dNchdeta/PythiaMC/BuildFile
dNchdetaPythiaMC_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/ServiceRegistry root CommonTools/UtilAlgos DataFormats/HeavyIonEvent SimDataFormats/HiGenData SimDataFormats/Vertex SimDataFormats/GeneratorProducts
dNchdetaPythiaMC_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,dNchdetaPythiaMC,dNchdetaPythiaMC,$(SCRAMSTORENAME_LIB),src/dNchdeta/PythiaMC/src))
dNchdetaPythiaMC_PACKAGE := self/src/dNchdeta/PythiaMC/src
ALL_PRODS += dNchdetaPythiaMC
dNchdetaPythiaMC_INIT_FUNC        += $$(eval $$(call Library,dNchdetaPythiaMC,src/dNchdeta/PythiaMC/src,src_dNchdeta_PythiaMC_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_dNchdeta_PythiaMC_test
src_dNchdeta_PythiaMC_test_parent := dNchdeta/PythiaMC
src_dNchdeta_PythiaMC_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_dNchdeta_PythiaMC_test,src/dNchdeta/PythiaMC/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/flowAnalysis)
subdirs_src_flowAnalysis = src_flowAnalysis_LYZfirst src_flowAnalysis_LYZsecond src_flowAnalysis_SkimTrack src_flowAnalysis_SkimPFCand
ALL_PACKAGES += $(patsubst src/%,%,src/flowAnalysis/LYZfirst)
subdirs_src_flowAnalysis_LYZfirst := src_flowAnalysis_LYZfirst_src src_flowAnalysis_LYZfirst_test src_flowAnalysis_LYZfirst_python
ifeq ($(strip $(PyflowAnalysisLYZfirst)),)
PyflowAnalysisLYZfirst := self/src/flowAnalysis/LYZfirst/python
src_flowAnalysis_LYZfirst_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/LYZfirst/python)
PyflowAnalysisLYZfirst_files := $(patsubst src/flowAnalysis/LYZfirst/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZfirst/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisLYZfirst_LOC_USE := self  
PyflowAnalysisLYZfirst_PACKAGE := self/src/flowAnalysis/LYZfirst/python
ALL_PRODS += PyflowAnalysisLYZfirst
PyflowAnalysisLYZfirst_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisLYZfirst,src/flowAnalysis/LYZfirst/python,src_flowAnalysis_LYZfirst_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisLYZfirst,src/flowAnalysis/LYZfirst/python))
endif
ALL_COMMONRULES += src_flowAnalysis_LYZfirst_python
src_flowAnalysis_LYZfirst_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZfirst_python,src/flowAnalysis/LYZfirst/python,PYTHON))
ifeq ($(strip $(flowAnalysis/LYZfirst)),)
ALL_COMMONRULES += src_flowAnalysis_LYZfirst_src
src_flowAnalysis_LYZfirst_src_parent := flowAnalysis/LYZfirst
src_flowAnalysis_LYZfirst_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZfirst_src,src/flowAnalysis/LYZfirst/src,LIBRARY))
flowAnalysisLYZfirst := self/flowAnalysis/LYZfirst
flowAnalysis/LYZfirst := flowAnalysisLYZfirst
flowAnalysisLYZfirst_files := $(patsubst src/flowAnalysis/LYZfirst/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZfirst/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisLYZfirst_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/LYZfirst/BuildFile
flowAnalysisLYZfirst_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisLYZfirst_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisLYZfirst,flowAnalysisLYZfirst,$(SCRAMSTORENAME_LIB),src/flowAnalysis/LYZfirst/src))
flowAnalysisLYZfirst_PACKAGE := self/src/flowAnalysis/LYZfirst/src
ALL_PRODS += flowAnalysisLYZfirst
flowAnalysisLYZfirst_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisLYZfirst,src/flowAnalysis/LYZfirst/src,src_flowAnalysis_LYZfirst_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_flowAnalysis_LYZfirst_test
src_flowAnalysis_LYZfirst_test_parent := flowAnalysis/LYZfirst
src_flowAnalysis_LYZfirst_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZfirst_test,src/flowAnalysis/LYZfirst/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/flowAnalysis/LYZsecond)
subdirs_src_flowAnalysis_LYZsecond := src_flowAnalysis_LYZsecond_src src_flowAnalysis_LYZsecond_test src_flowAnalysis_LYZsecond_python
ifeq ($(strip $(PyflowAnalysisLYZsecond)),)
PyflowAnalysisLYZsecond := self/src/flowAnalysis/LYZsecond/python
src_flowAnalysis_LYZsecond_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/LYZsecond/python)
PyflowAnalysisLYZsecond_files := $(patsubst src/flowAnalysis/LYZsecond/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZsecond/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisLYZsecond_LOC_USE := self  
PyflowAnalysisLYZsecond_PACKAGE := self/src/flowAnalysis/LYZsecond/python
ALL_PRODS += PyflowAnalysisLYZsecond
PyflowAnalysisLYZsecond_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisLYZsecond,src/flowAnalysis/LYZsecond/python,src_flowAnalysis_LYZsecond_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisLYZsecond,src/flowAnalysis/LYZsecond/python))
endif
ALL_COMMONRULES += src_flowAnalysis_LYZsecond_python
src_flowAnalysis_LYZsecond_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZsecond_python,src/flowAnalysis/LYZsecond/python,PYTHON))
ifeq ($(strip $(flowAnalysis/LYZsecond)),)
ALL_COMMONRULES += src_flowAnalysis_LYZsecond_src
src_flowAnalysis_LYZsecond_src_parent := flowAnalysis/LYZsecond
src_flowAnalysis_LYZsecond_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZsecond_src,src/flowAnalysis/LYZsecond/src,LIBRARY))
flowAnalysisLYZsecond := self/flowAnalysis/LYZsecond
flowAnalysis/LYZsecond := flowAnalysisLYZsecond
flowAnalysisLYZsecond_files := $(patsubst src/flowAnalysis/LYZsecond/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/LYZsecond/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisLYZsecond_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/LYZsecond/BuildFile
flowAnalysisLYZsecond_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisLYZsecond_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisLYZsecond,flowAnalysisLYZsecond,$(SCRAMSTORENAME_LIB),src/flowAnalysis/LYZsecond/src))
flowAnalysisLYZsecond_PACKAGE := self/src/flowAnalysis/LYZsecond/src
ALL_PRODS += flowAnalysisLYZsecond
flowAnalysisLYZsecond_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisLYZsecond,src/flowAnalysis/LYZsecond/src,src_flowAnalysis_LYZsecond_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_flowAnalysis_LYZsecond_test
src_flowAnalysis_LYZsecond_test_parent := flowAnalysis/LYZsecond
src_flowAnalysis_LYZsecond_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_LYZsecond_test,src/flowAnalysis/LYZsecond/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/flowAnalysis/SkimPFCand)
subdirs_src_flowAnalysis_SkimPFCand := src_flowAnalysis_SkimPFCand_src src_flowAnalysis_SkimPFCand_test src_flowAnalysis_SkimPFCand_python
ifeq ($(strip $(PyflowAnalysisSkimPFCand)),)
PyflowAnalysisSkimPFCand := self/src/flowAnalysis/SkimPFCand/python
src_flowAnalysis_SkimPFCand_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/SkimPFCand/python)
PyflowAnalysisSkimPFCand_files := $(patsubst src/flowAnalysis/SkimPFCand/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimPFCand/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisSkimPFCand_LOC_USE := self  
PyflowAnalysisSkimPFCand_PACKAGE := self/src/flowAnalysis/SkimPFCand/python
ALL_PRODS += PyflowAnalysisSkimPFCand
PyflowAnalysisSkimPFCand_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisSkimPFCand,src/flowAnalysis/SkimPFCand/python,src_flowAnalysis_SkimPFCand_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisSkimPFCand,src/flowAnalysis/SkimPFCand/python))
endif
ALL_COMMONRULES += src_flowAnalysis_SkimPFCand_python
src_flowAnalysis_SkimPFCand_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimPFCand_python,src/flowAnalysis/SkimPFCand/python,PYTHON))
ifeq ($(strip $(flowAnalysis/SkimPFCand)),)
ALL_COMMONRULES += src_flowAnalysis_SkimPFCand_src
src_flowAnalysis_SkimPFCand_src_parent := flowAnalysis/SkimPFCand
src_flowAnalysis_SkimPFCand_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimPFCand_src,src/flowAnalysis/SkimPFCand/src,LIBRARY))
flowAnalysisSkimPFCand := self/flowAnalysis/SkimPFCand
flowAnalysis/SkimPFCand := flowAnalysisSkimPFCand
flowAnalysisSkimPFCand_files := $(patsubst src/flowAnalysis/SkimPFCand/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimPFCand/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisSkimPFCand_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/SkimPFCand/BuildFile
flowAnalysisSkimPFCand_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco DataFormats/ParticleFlowCandidate FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisSkimPFCand_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisSkimPFCand,flowAnalysisSkimPFCand,$(SCRAMSTORENAME_LIB),src/flowAnalysis/SkimPFCand/src))
flowAnalysisSkimPFCand_PACKAGE := self/src/flowAnalysis/SkimPFCand/src
ALL_PRODS += flowAnalysisSkimPFCand
flowAnalysisSkimPFCand_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisSkimPFCand,src/flowAnalysis/SkimPFCand/src,src_flowAnalysis_SkimPFCand_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_flowAnalysis_SkimPFCand_test
src_flowAnalysis_SkimPFCand_test_parent := flowAnalysis/SkimPFCand
src_flowAnalysis_SkimPFCand_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimPFCand_test,src/flowAnalysis/SkimPFCand/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/flowAnalysis/SkimTrack)
subdirs_src_flowAnalysis_SkimTrack := src_flowAnalysis_SkimTrack_src src_flowAnalysis_SkimTrack_test src_flowAnalysis_SkimTrack_python
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/myAnalyzers)
subdirs_src_myAnalyzers = src_myAnalyzers_V0RecoAnalyzer src_myAnalyzers_PiLambda
ifeq ($(strip $(PyflowAnalysisSkimTrack)),)
PyflowAnalysisSkimTrack := self/src/flowAnalysis/SkimTrack/python
src_flowAnalysis_SkimTrack_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/flowAnalysis/SkimTrack/python)
PyflowAnalysisSkimTrack_files := $(patsubst src/flowAnalysis/SkimTrack/python/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimTrack/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyflowAnalysisSkimTrack_LOC_USE := self  
PyflowAnalysisSkimTrack_PACKAGE := self/src/flowAnalysis/SkimTrack/python
ALL_PRODS += PyflowAnalysisSkimTrack
PyflowAnalysisSkimTrack_INIT_FUNC        += $$(eval $$(call PythonProduct,PyflowAnalysisSkimTrack,src/flowAnalysis/SkimTrack/python,src_flowAnalysis_SkimTrack_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyflowAnalysisSkimTrack,src/flowAnalysis/SkimTrack/python))
endif
ALL_COMMONRULES += src_flowAnalysis_SkimTrack_python
src_flowAnalysis_SkimTrack_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimTrack_python,src/flowAnalysis/SkimTrack/python,PYTHON))
ifeq ($(strip $(flowAnalysis/SkimTrack)),)
ALL_COMMONRULES += src_flowAnalysis_SkimTrack_src
src_flowAnalysis_SkimTrack_src_parent := flowAnalysis/SkimTrack
src_flowAnalysis_SkimTrack_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimTrack_src,src/flowAnalysis/SkimTrack/src,LIBRARY))
flowAnalysisSkimTrack := self/flowAnalysis/SkimTrack
flowAnalysis/SkimTrack := flowAnalysisSkimTrack
flowAnalysisSkimTrack_files := $(patsubst src/flowAnalysis/SkimTrack/src/%,%,$(wildcard $(foreach dir,src/flowAnalysis/SkimTrack/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
flowAnalysisSkimTrack_BuildFile    := $(WORKINGDIR)/cache/bf/src/flowAnalysis/SkimTrack/BuildFile
flowAnalysisSkimTrack_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet root FWCore/Common CommonTools/UtilAlgos DataFormats/TrackReco DataFormats/VertexReco FWCore/ServiceRegistry DataFormats/HeavyIonEvent
flowAnalysisSkimTrack_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,flowAnalysisSkimTrack,flowAnalysisSkimTrack,$(SCRAMSTORENAME_LIB),src/flowAnalysis/SkimTrack/src))
flowAnalysisSkimTrack_PACKAGE := self/src/flowAnalysis/SkimTrack/src
ALL_PRODS += flowAnalysisSkimTrack
flowAnalysisSkimTrack_INIT_FUNC        += $$(eval $$(call Library,flowAnalysisSkimTrack,src/flowAnalysis/SkimTrack/src,src_flowAnalysis_SkimTrack_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_flowAnalysis_SkimTrack_test
src_flowAnalysis_SkimTrack_test_parent := flowAnalysis/SkimTrack
src_flowAnalysis_SkimTrack_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_flowAnalysis_SkimTrack_test,src/flowAnalysis/SkimTrack/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/myAnalyzers/PiLambda)
subdirs_src_myAnalyzers_PiLambda := src_myAnalyzers_PiLambda_src src_myAnalyzers_PiLambda_test
ifeq ($(strip $(myAnalyzers/PiLambda)),)
ALL_COMMONRULES += src_myAnalyzers_PiLambda_src
src_myAnalyzers_PiLambda_src_parent := myAnalyzers/PiLambda
src_myAnalyzers_PiLambda_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myAnalyzers_PiLambda_src,src/myAnalyzers/PiLambda/src,LIBRARY))
myAnalyzersPiLambda := self/myAnalyzers/PiLambda
myAnalyzers/PiLambda := myAnalyzersPiLambda
myAnalyzersPiLambda_files := $(patsubst src/myAnalyzers/PiLambda/src/%,%,$(wildcard $(foreach dir,src/myAnalyzers/PiLambda/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myAnalyzersPiLambda_BuildFile    := $(WORKINGDIR)/cache/bf/src/myAnalyzers/PiLambda/BuildFile
myAnalyzersPiLambda_LOC_USE := self  CommonTools/UtilAlgos FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/Candidate DataFormats/Common DataFormats/RecoCandidate DataFormats/PatCandidates DataFormats/TrackReco DataFormats/VertexReco DataFormats/Math RecoVertex/PrimaryVertexProducer RecoVertex/KinematicFit RecoVertex/KinematicFitPrimitives TrackingTools/TransientTrack TrackingTools/IPTools TrackingTools/Records MagneticField/Engine DataFormats/HepMCCandidate CondFormats/L1TObjects DataFormats/L1GlobalTrigger DataFormats/HcalDetId CondFormats/DataRecord
myAnalyzersPiLambda_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,myAnalyzersPiLambda,myAnalyzersPiLambda,$(SCRAMSTORENAME_LIB),src/myAnalyzers/PiLambda/src))
myAnalyzersPiLambda_PACKAGE := self/src/myAnalyzers/PiLambda/src
ALL_PRODS += myAnalyzersPiLambda
myAnalyzersPiLambda_INIT_FUNC        += $$(eval $$(call Library,myAnalyzersPiLambda,src/myAnalyzers/PiLambda/src,src_myAnalyzers_PiLambda_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_myAnalyzers_PiLambda_test
src_myAnalyzers_PiLambda_test_parent := myAnalyzers/PiLambda
src_myAnalyzers_PiLambda_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_PiLambda_test,src/myAnalyzers/PiLambda/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/myAnalyzers/V0RecoAnalyzer)
subdirs_src_myAnalyzers_V0RecoAnalyzer := src_myAnalyzers_V0RecoAnalyzer_python src_myAnalyzers_V0RecoAnalyzer_src src_myAnalyzers_V0RecoAnalyzer_test
ifeq ($(strip $(PymyAnalyzersV0RecoAnalyzer)),)
PymyAnalyzersV0RecoAnalyzer := self/src/myAnalyzers/V0RecoAnalyzer/python
src_myAnalyzers_V0RecoAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myAnalyzers/V0RecoAnalyzer/python)
PymyAnalyzersV0RecoAnalyzer_files := $(patsubst src/myAnalyzers/V0RecoAnalyzer/python/%,%,$(wildcard $(foreach dir,src/myAnalyzers/V0RecoAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyAnalyzersV0RecoAnalyzer_LOC_USE := self  
PymyAnalyzersV0RecoAnalyzer_PACKAGE := self/src/myAnalyzers/V0RecoAnalyzer/python
ALL_PRODS += PymyAnalyzersV0RecoAnalyzer
PymyAnalyzersV0RecoAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyAnalyzersV0RecoAnalyzer,src/myAnalyzers/V0RecoAnalyzer/python,src_myAnalyzers_V0RecoAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyAnalyzersV0RecoAnalyzer,src/myAnalyzers/V0RecoAnalyzer/python))
endif
ALL_COMMONRULES += src_myAnalyzers_V0RecoAnalyzer_python
src_myAnalyzers_V0RecoAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_V0RecoAnalyzer_python,src/myAnalyzers/V0RecoAnalyzer/python,PYTHON))
ifeq ($(strip $(myAnalyzers/V0RecoAnalyzer)),)
ALL_COMMONRULES += src_myAnalyzers_V0RecoAnalyzer_src
src_myAnalyzers_V0RecoAnalyzer_src_parent := myAnalyzers/V0RecoAnalyzer
src_myAnalyzers_V0RecoAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myAnalyzers_V0RecoAnalyzer_src,src/myAnalyzers/V0RecoAnalyzer/src,LIBRARY))
myAnalyzersV0RecoAnalyzer := self/myAnalyzers/V0RecoAnalyzer
myAnalyzers/V0RecoAnalyzer := myAnalyzersV0RecoAnalyzer
myAnalyzersV0RecoAnalyzer_files := $(patsubst src/myAnalyzers/V0RecoAnalyzer/src/%,%,$(wildcard $(foreach dir,src/myAnalyzers/V0RecoAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myAnalyzersV0RecoAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/myAnalyzers/V0RecoAnalyzer/BuildFile
myAnalyzersV0RecoAnalyzer_LOC_USE := self  root DataFormats/BeamSpot DataFormats/Candidate DataFormats/Common SimDataFormats/GeneratorProducts DataFormats/PatCandidates DataFormats/RecoCandidate DataFormats/VertexReco DataFormats/V0Candidate FWCore/Framework FWCore/PluginManager FWCore/ParameterSet MagneticField/Engine MagneticField/Records CommonTools/UtilAlgos RecoVertex/KalmanVertexFit RecoVertex/AdaptiveVertexFit RecoVertex/VertexTools RecoVertex/KinematicFit RecoVertex/KinematicFitPrimitives TrackingTools/Records TrackingTools/TransientTrack TrackingTools/IPTools TrackingTools/PatternTools TrackingTools/TrajectoryState CondFormats/L1TObjects DataFormats/L1GlobalTrigger CondFormats/DataRecord
myAnalyzersV0RecoAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,myAnalyzersV0RecoAnalyzer,myAnalyzersV0RecoAnalyzer,$(SCRAMSTORENAME_LIB),src/myAnalyzers/V0RecoAnalyzer/src))
myAnalyzersV0RecoAnalyzer_PACKAGE := self/src/myAnalyzers/V0RecoAnalyzer/src
ALL_PRODS += myAnalyzersV0RecoAnalyzer
myAnalyzersV0RecoAnalyzer_INIT_FUNC        += $$(eval $$(call Library,myAnalyzersV0RecoAnalyzer,src/myAnalyzers/V0RecoAnalyzer/src,src_myAnalyzers_V0RecoAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_myAnalyzers_V0RecoAnalyzer_test
src_myAnalyzers_V0RecoAnalyzer_test_parent := myAnalyzers/V0RecoAnalyzer
src_myAnalyzers_V0RecoAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_V0RecoAnalyzer_test,src/myAnalyzers/V0RecoAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/myFilters)
subdirs_src_myFilters = src_myFilters_V0CandFilter
ALL_PACKAGES += $(patsubst src/%,%,src/myFilters/V0CandFilter)
subdirs_src_myFilters_V0CandFilter := src_myFilters_V0CandFilter_python src_myFilters_V0CandFilter_src src_myFilters_V0CandFilter_test
ifeq ($(strip $(PymyFiltersV0CandFilter)),)
PymyFiltersV0CandFilter := self/src/myFilters/V0CandFilter/python
src_myFilters_V0CandFilter_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myFilters/V0CandFilter/python)
PymyFiltersV0CandFilter_files := $(patsubst src/myFilters/V0CandFilter/python/%,%,$(wildcard $(foreach dir,src/myFilters/V0CandFilter/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyFiltersV0CandFilter_LOC_USE := self  
PymyFiltersV0CandFilter_PACKAGE := self/src/myFilters/V0CandFilter/python
ALL_PRODS += PymyFiltersV0CandFilter
PymyFiltersV0CandFilter_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyFiltersV0CandFilter,src/myFilters/V0CandFilter/python,src_myFilters_V0CandFilter_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyFiltersV0CandFilter,src/myFilters/V0CandFilter/python))
endif
ALL_COMMONRULES += src_myFilters_V0CandFilter_python
src_myFilters_V0CandFilter_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_python,src/myFilters/V0CandFilter/python,PYTHON))
ifeq ($(strip $(myFilters/V0CandFilter)),)
ALL_COMMONRULES += src_myFilters_V0CandFilter_src
src_myFilters_V0CandFilter_src_parent := myFilters/V0CandFilter
src_myFilters_V0CandFilter_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_src,src/myFilters/V0CandFilter/src,LIBRARY))
myFiltersV0CandFilter := self/myFilters/V0CandFilter
myFilters/V0CandFilter := myFiltersV0CandFilter
myFiltersV0CandFilter_files := $(patsubst src/myFilters/V0CandFilter/src/%,%,$(wildcard $(foreach dir,src/myFilters/V0CandFilter/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myFiltersV0CandFilter_BuildFile    := $(WORKINGDIR)/cache/bf/src/myFilters/V0CandFilter/BuildFile
myFiltersV0CandFilter_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/Candidate DataFormats/TrackReco
myFiltersV0CandFilter_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,myFiltersV0CandFilter,myFiltersV0CandFilter,$(SCRAMSTORENAME_LIB),src/myFilters/V0CandFilter/src))
myFiltersV0CandFilter_PACKAGE := self/src/myFilters/V0CandFilter/src
ALL_PRODS += myFiltersV0CandFilter
myFiltersV0CandFilter_INIT_FUNC        += $$(eval $$(call Library,myFiltersV0CandFilter,src/myFilters/V0CandFilter/src,src_myFilters_V0CandFilter_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_myFilters_V0CandFilter_test
src_myFilters_V0CandFilter_test_parent := myFilters/V0CandFilter
src_myFilters_V0CandFilter_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_test,src/myFilters/V0CandFilter/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/myProducers)
subdirs_src_myProducers = src_myProducers_V0CandProducer src_myProducers_V0TrackFilter
ALL_PACKAGES += $(patsubst src/%,%,src/myProducers/V0CandProducer)
subdirs_src_myProducers_V0CandProducer := src_myProducers_V0CandProducer_interface src_myProducers_V0CandProducer_python src_myProducers_V0CandProducer_src
ifeq ($(strip $(PymyProducersV0CandProducer)),)
PymyProducersV0CandProducer := self/src/myProducers/V0CandProducer/python
src_myProducers_V0CandProducer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myProducers/V0CandProducer/python)
PymyProducersV0CandProducer_files := $(patsubst src/myProducers/V0CandProducer/python/%,%,$(wildcard $(foreach dir,src/myProducers/V0CandProducer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyProducersV0CandProducer_LOC_USE := self  
PymyProducersV0CandProducer_PACKAGE := self/src/myProducers/V0CandProducer/python
ALL_PRODS += PymyProducersV0CandProducer
PymyProducersV0CandProducer_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyProducersV0CandProducer,src/myProducers/V0CandProducer/python,src_myProducers_V0CandProducer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyProducersV0CandProducer,src/myProducers/V0CandProducer/python))
endif
ALL_COMMONRULES += src_myProducers_V0CandProducer_python
src_myProducers_V0CandProducer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myProducers_V0CandProducer_python,src/myProducers/V0CandProducer/python,PYTHON))
ifeq ($(strip $(myProducers/V0CandProducer)),)
ALL_COMMONRULES += src_myProducers_V0CandProducer_src
src_myProducers_V0CandProducer_src_parent := myProducers/V0CandProducer
src_myProducers_V0CandProducer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myProducers_V0CandProducer_src,src/myProducers/V0CandProducer/src,LIBRARY))
myProducersV0CandProducer := self/myProducers/V0CandProducer
myProducers/V0CandProducer := myProducersV0CandProducer
myProducersV0CandProducer_files := $(patsubst src/myProducers/V0CandProducer/src/%,%,$(wildcard $(foreach dir,src/myProducers/V0CandProducer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myProducersV0CandProducer_BuildFile    := $(WORKINGDIR)/cache/bf/src/myProducers/V0CandProducer/BuildFile
myProducersV0CandProducer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/PatCandidates DataFormats/RecoCandidate DataFormats/V0Candidate TrackingTools/Records TrackingTools/TransientTrack RecoVertex/KalmanVertexFit RecoVertex/VertexTools
myProducersV0CandProducer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,myProducersV0CandProducer,myProducersV0CandProducer,$(SCRAMSTORENAME_LIB),src/myProducers/V0CandProducer/src))
myProducersV0CandProducer_PACKAGE := self/src/myProducers/V0CandProducer/src
ALL_PRODS += myProducersV0CandProducer
myProducersV0CandProducer_INIT_FUNC        += $$(eval $$(call Library,myProducersV0CandProducer,src/myProducers/V0CandProducer/src,src_myProducers_V0CandProducer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_PACKAGES += $(patsubst src/%,%,src/myProducers/V0TrackFilter)
subdirs_src_myProducers_V0TrackFilter := src_myProducers_V0TrackFilter_python
ifeq ($(strip $(PymyProducersV0TrackFilter)),)
PymyProducersV0TrackFilter := self/src/myProducers/V0TrackFilter/python
src_myProducers_V0TrackFilter_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/myProducers/V0TrackFilter/python)
PymyProducersV0TrackFilter_files := $(patsubst src/myProducers/V0TrackFilter/python/%,%,$(wildcard $(foreach dir,src/myProducers/V0TrackFilter/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PymyProducersV0TrackFilter_LOC_USE := self  
PymyProducersV0TrackFilter_PACKAGE := self/src/myProducers/V0TrackFilter/python
ALL_PRODS += PymyProducersV0TrackFilter
PymyProducersV0TrackFilter_INIT_FUNC        += $$(eval $$(call PythonProduct,PymyProducersV0TrackFilter,src/myProducers/V0TrackFilter/python,src_myProducers_V0TrackFilter_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PymyProducersV0TrackFilter,src/myProducers/V0TrackFilter/python))
endif
ALL_COMMONRULES += src_myProducers_V0TrackFilter_python
src_myProducers_V0TrackFilter_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myProducers_V0TrackFilter_python,src/myProducers/V0TrackFilter/python,PYTHON))
