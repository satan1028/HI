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
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/Appeltel)
subdirs_src_Appeltel = src_Appeltel_RpPbAnalysis
ALL_PACKAGES += $(patsubst src/%,%,src/Appeltel/RpPbAnalysis)
subdirs_src_Appeltel_RpPbAnalysis := src_Appeltel_RpPbAnalysis_test src_Appeltel_RpPbAnalysis_scripts src_Appeltel_RpPbAnalysis_src src_Appeltel_RpPbAnalysis_python
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
subdirs_src_DataFormats_HeavyIonEvent := src_DataFormats_HeavyIonEvent_src
ALL_PACKAGES += $(patsubst src/%,%,src/GeneratorInterface/AnaHijing)
subdirs_src_GeneratorInterface_AnaHijing := src_GeneratorInterface_AnaHijing_interface src_GeneratorInterface_AnaHijing_src src_GeneratorInterface_AnaHijing_test src_GeneratorInterface_AnaHijing_doc src_GeneratorInterface_AnaHijing_python
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/EffAna)
subdirs_src_EffAna = src_EffAna_AnaEff src_EffAna_ESAnaEff
ALL_PACKAGES += $(patsubst src/%,%,src/EffAna/AnaEff)
subdirs_src_EffAna_AnaEff := src_EffAna_AnaEff_src src_EffAna_AnaEff_test src_EffAna_AnaEff_doc src_EffAna_AnaEff_python
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
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/HeavyIonsAnalysis)
subdirs_src_HeavyIonsAnalysis = src_HeavyIonsAnalysis_Configuration
ALL_PACKAGES += $(patsubst src/%,%,src/HeavyIonsAnalysis/Configuration)
subdirs_src_HeavyIonsAnalysis_Configuration := src_HeavyIonsAnalysis_Configuration_python src_HeavyIonsAnalysis_Configuration_src src_HeavyIonsAnalysis_Configuration_test
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
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/PythiaMC)
subdirs_src_PythiaMC = src_PythiaMC_interface src_PythiaMC_src src_PythiaMC_test src_PythiaMC_doc src_PythiaMC_python
ALL_PACKAGES += $(patsubst src/%,%,src/PythiaMC/doc)
subdirs_src_PythiaMC_doc := 
ALL_PACKAGES += $(patsubst src/%,%,src/PythiaMC/interface)
subdirs_src_PythiaMC_interface := 
ALL_PACKAGES += $(patsubst src/%,%,src/PythiaMC/python)
subdirs_src_PythiaMC_python := 
ALL_PACKAGES += $(patsubst src/%,%,src/PythiaMC/src)
subdirs_src_PythiaMC_src := 
ALL_PACKAGES += $(patsubst src/%,%,src/PythiaMC/test)
subdirs_src_PythiaMC_test := 
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/RecoHI)
subdirs_src_RecoHI = src_RecoHI_HiCentralityAlgos
ALL_PACKAGES += $(patsubst src/%,%,src/RecoHI/HiCentralityAlgos)
subdirs_src_RecoHI_HiCentralityAlgos := src_RecoHI_HiCentralityAlgos_test src_RecoHI_HiCentralityAlgos_src src_RecoHI_HiCentralityAlgos_python
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
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/flowAnalysis)
subdirs_src_flowAnalysis = src_flowAnalysis_LYZfirst src_flowAnalysis_LYZsecond src_flowAnalysis_SkimTrack src_flowAnalysis_SkimPFCand
ALL_PACKAGES += $(patsubst src/%,%,src/flowAnalysis/LYZfirst)
subdirs_src_flowAnalysis_LYZfirst := src_flowAnalysis_LYZfirst_interface src_flowAnalysis_LYZfirst_src src_flowAnalysis_LYZfirst_test src_flowAnalysis_LYZfirst_doc src_flowAnalysis_LYZfirst_python
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
subdirs_src_flowAnalysis_LYZsecond := src_flowAnalysis_LYZsecond_interface src_flowAnalysis_LYZsecond_src src_flowAnalysis_LYZsecond_test src_flowAnalysis_LYZsecond_doc src_flowAnalysis_LYZsecond_python
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
subdirs_src_flowAnalysis_SkimPFCand := src_flowAnalysis_SkimPFCand_src src_flowAnalysis_SkimPFCand_python src_flowAnalysis_SkimPFCand_test
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
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/V0Eff)
subdirs_src_V0Eff = src_V0Eff_V0DeltaREffAnalyzer
ALL_PACKAGES += $(patsubst src/%,%,src/V0Eff/V0DeltaREffAnalyzer)
subdirs_src_V0Eff_V0DeltaREffAnalyzer := src_V0Eff_V0DeltaREffAnalyzer_test src_V0Eff_V0DeltaREffAnalyzer_python src_V0Eff_V0DeltaREffAnalyzer_src
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
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_test
src_V0Eff_V0DeltaREffAnalyzer_test_parent := V0Eff/V0DeltaREffAnalyzer
src_V0Eff_V0DeltaREffAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_test,src/V0Eff/V0DeltaREffAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/V0Scripts)
subdirs_src_V0Scripts = src_V0Scripts_finalMassPlots src_V0Scripts_final_plots src_V0Scripts_plots
ALL_PACKAGES += $(patsubst src/%,%,src/V0Scripts/finalMassPlots)
subdirs_src_V0Scripts_finalMassPlots := 
ALL_PACKAGES += $(patsubst src/%,%,src/V0Scripts/final_plots)
subdirs_src_V0Scripts_final_plots := 
ALL_PACKAGES += $(patsubst src/%,%,src/V0Scripts/plots)
subdirs_src_V0Scripts_plots := 
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/myAnalyzers)
subdirs_src_myAnalyzers = src_myAnalyzers_PiLambda src_myAnalyzers_V0RecoAnalyzer
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/usercode)
subdirs_src_usercode = src_usercode_GeneralAnalyzers src_usercode_HeavyIonsAnalysis src_usercode_PhysicsTools src_usercode_SimG4Core src_usercode_HIN-10-002 src_usercode_HITrackCorrections src_usercode_JEX src_usercode_MergedTrackCorrections src_usercode_Misc src_usercode_Phase1HITracking src_usercode_PixelFiducialRemover src_usercode_PixelTrackAnalysis src_usercode_PixelTracksRun2010 src_usercode_SiStripCMNAnalyzer src_usercode_hackedSiStripDigitizer
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/GeneralAnalyzers)
subdirs_src_usercode_GeneralAnalyzers := src_usercode_GeneralAnalyzers_bin src_usercode_GeneralAnalyzers_test src_usercode_GeneralAnalyzers_src
ifeq ($(strip $(PlotCaloTowers)),)
PlotCaloTowers_files := $(patsubst src/usercode/GeneralAnalyzers/bin/%,%,$(foreach file,PlotCaloTowers.cc,$(eval xfile:=$(wildcard src/usercode/GeneralAnalyzers/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/usercode/GeneralAnalyzers/bin/$(file). Please fix src/usercode/GeneralAnalyzers/bin/BuildFile.))))
PlotCaloTowers := self/src/usercode/GeneralAnalyzers/bin
PlotCaloTowers_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/GeneralAnalyzers/bin/BuildFile
PlotCaloTowers_LOC_USE := self  root boost rootcintex DataFormats/FWLite FWCore/FWLite FWCore/Framework CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities DataFormats/Common DataFormats/CaloTowers
PlotCaloTowers_PACKAGE := self/src/usercode/GeneralAnalyzers/bin
ALL_PRODS += PlotCaloTowers
PlotCaloTowers_INIT_FUNC        += $$(eval $$(call Binary,PlotCaloTowers,src/usercode/GeneralAnalyzers/bin,src_usercode_GeneralAnalyzers_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,PlotCaloTowers,src/usercode/GeneralAnalyzers/bin))
endif
ALL_COMMONRULES += src_usercode_GeneralAnalyzers_bin
src_usercode_GeneralAnalyzers_bin_parent := usercode/GeneralAnalyzers
src_usercode_GeneralAnalyzers_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_GeneralAnalyzers_bin,src/usercode/GeneralAnalyzers/bin,BINARY))
ifeq ($(strip $(usercode/GeneralAnalyzers)),)
ALL_COMMONRULES += src_usercode_GeneralAnalyzers_src
src_usercode_GeneralAnalyzers_src_parent := usercode/GeneralAnalyzers
src_usercode_GeneralAnalyzers_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_GeneralAnalyzers_src,src/usercode/GeneralAnalyzers/src,LIBRARY))
usercodeGeneralAnalyzers := self/usercode/GeneralAnalyzers
usercode/GeneralAnalyzers := usercodeGeneralAnalyzers
usercodeGeneralAnalyzers_files := $(patsubst src/usercode/GeneralAnalyzers/src/%,%,$(wildcard $(foreach dir,src/usercode/GeneralAnalyzers/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeGeneralAnalyzers_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/GeneralAnalyzers/BuildFile
usercodeGeneralAnalyzers_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math Geometry/Records
usercodeGeneralAnalyzers_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeGeneralAnalyzers,usercodeGeneralAnalyzers,$(SCRAMSTORENAME_LIB),src/usercode/GeneralAnalyzers/src))
usercodeGeneralAnalyzers_PACKAGE := self/src/usercode/GeneralAnalyzers/src
ALL_PRODS += usercodeGeneralAnalyzers
usercodeGeneralAnalyzers_INIT_FUNC        += $$(eval $$(call Library,usercodeGeneralAnalyzers,src/usercode/GeneralAnalyzers/src,src_usercode_GeneralAnalyzers_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_usercode_GeneralAnalyzers_test
src_usercode_GeneralAnalyzers_test_parent := usercode/GeneralAnalyzers
src_usercode_GeneralAnalyzers_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_GeneralAnalyzers_test,src/usercode/GeneralAnalyzers/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/JEX)
subdirs_src_usercode_JEX := src_usercode_JEX_python src_usercode_JEX_scripts src_usercode_JEX_src src_usercode_JEX_test
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/HIN-10-002)
subdirs_src_usercode_HIN-10-002 := 
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/HITrackCorrections)
subdirs_src_usercode_HITrackCorrections := src_usercode_HITrackCorrections_python src_usercode_HITrackCorrections_src src_usercode_HITrackCorrections_test
ifeq ($(strip $(PyusercodeHITrackCorrections)),)
PyusercodeHITrackCorrections := self/src/usercode/HITrackCorrections/python
src_usercode_HITrackCorrections_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/usercode/HITrackCorrections/python)
PyusercodeHITrackCorrections_files := $(patsubst src/usercode/HITrackCorrections/python/%,%,$(wildcard $(foreach dir,src/usercode/HITrackCorrections/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyusercodeHITrackCorrections_LOC_USE := self  
PyusercodeHITrackCorrections_PACKAGE := self/src/usercode/HITrackCorrections/python
ALL_PRODS += PyusercodeHITrackCorrections
PyusercodeHITrackCorrections_INIT_FUNC        += $$(eval $$(call PythonProduct,PyusercodeHITrackCorrections,src/usercode/HITrackCorrections/python,src_usercode_HITrackCorrections_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyusercodeHITrackCorrections,src/usercode/HITrackCorrections/python))
endif
ALL_COMMONRULES += src_usercode_HITrackCorrections_python
src_usercode_HITrackCorrections_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_HITrackCorrections_python,src/usercode/HITrackCorrections/python,PYTHON))
ifeq ($(strip $(usercode/HITrackCorrections)),)
ALL_COMMONRULES += src_usercode_HITrackCorrections_src
src_usercode_HITrackCorrections_src_parent := usercode/HITrackCorrections
src_usercode_HITrackCorrections_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_HITrackCorrections_src,src/usercode/HITrackCorrections/src,LIBRARY))
usercodeHITrackCorrections := self/usercode/HITrackCorrections
usercode/HITrackCorrections := usercodeHITrackCorrections
usercodeHITrackCorrections_files := $(patsubst src/usercode/HITrackCorrections/src/%,%,$(wildcard $(foreach dir,src/usercode/HITrackCorrections/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeHITrackCorrections_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/HITrackCorrections/BuildFile
usercodeHITrackCorrections_LOC_USE := self  hepmc FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelDetId DataFormats/DetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records FWCore/ServiceRegistry CommonTools/UtilAlgos DataFormats/SiStripCluster DataFormats/SiPixelCluster DataFormats/HeavyIonEvent DataFormats/TrackReco DataFormats/VertexReco DataFormats/HepMCCandidate DataFormats/Math DataFormats/Scalers
usercodeHITrackCorrections_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeHITrackCorrections,usercodeHITrackCorrections,$(SCRAMSTORENAME_LIB),src/usercode/HITrackCorrections/src))
usercodeHITrackCorrections_PACKAGE := self/src/usercode/HITrackCorrections/src
ALL_PRODS += usercodeHITrackCorrections
usercodeHITrackCorrections_INIT_FUNC        += $$(eval $$(call Library,usercodeHITrackCorrections,src/usercode/HITrackCorrections/src,src_usercode_HITrackCorrections_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_usercode_HITrackCorrections_test
src_usercode_HITrackCorrections_test_parent := usercode/HITrackCorrections
src_usercode_HITrackCorrections_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_HITrackCorrections_test,src/usercode/HITrackCorrections/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/HeavyIonsAnalysis)
subdirs_src_usercode_HeavyIonsAnalysis := 
ifeq ($(strip $(PyusercodeJEX)),)
PyusercodeJEX := self/src/usercode/JEX/python
src_usercode_JEX_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/usercode/JEX/python)
PyusercodeJEX_files := $(patsubst src/usercode/JEX/python/%,%,$(wildcard $(foreach dir,src/usercode/JEX/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyusercodeJEX_LOC_USE := self  
PyusercodeJEX_PACKAGE := self/src/usercode/JEX/python
ALL_PRODS += PyusercodeJEX
PyusercodeJEX_INIT_FUNC        += $$(eval $$(call PythonProduct,PyusercodeJEX,src/usercode/JEX/python,src_usercode_JEX_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyusercodeJEX,src/usercode/JEX/python))
endif
ALL_COMMONRULES += src_usercode_JEX_python
src_usercode_JEX_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_JEX_python,src/usercode/JEX/python,PYTHON))
src_usercode_JEX_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/usercode/JEX/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_usercode_JEX_scripts,src/usercode/JEX/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(usercode/JEX)),)
ALL_COMMONRULES += src_usercode_JEX_src
src_usercode_JEX_src_parent := usercode/JEX
src_usercode_JEX_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_JEX_src,src/usercode/JEX/src,LIBRARY))
usercodeJEX := self/usercode/JEX
usercode/JEX := usercodeJEX
usercodeJEX_files := $(patsubst src/usercode/JEX/src/%,%,$(wildcard $(foreach dir,src/usercode/JEX/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeJEX_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/JEX/BuildFile
usercodeJEX_LOC_USE := self  DataFormats/Common DataFormats/DetId DataFormats/Math DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackCandidate DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records TrackingTools/PatternTools RecoLocalTracker/SiStripClusterizer RecoLocalTracker/Records TrackingTools/TransientTrack TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoTracker/TrackProducer RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools CommonTools/Utils clhep
usercodeJEX_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeJEX,usercodeJEX,$(SCRAMSTORENAME_LIB),src/usercode/JEX/src))
usercodeJEX_PACKAGE := self/src/usercode/JEX/src
ALL_PRODS += usercodeJEX
usercodeJEX_INIT_FUNC        += $$(eval $$(call Library,usercodeJEX,src/usercode/JEX/src,src_usercode_JEX_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_usercode_JEX_test
src_usercode_JEX_test_parent := usercode/JEX
src_usercode_JEX_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_JEX_test,src/usercode/JEX/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/MergedTrackCorrections)
subdirs_src_usercode_MergedTrackCorrections := src_usercode_MergedTrackCorrections_data src_usercode_MergedTrackCorrections_src
ifeq ($(strip $(usercode/MergedTrackCorrections)),)
ALL_COMMONRULES += src_usercode_MergedTrackCorrections_src
src_usercode_MergedTrackCorrections_src_parent := usercode/MergedTrackCorrections
src_usercode_MergedTrackCorrections_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_MergedTrackCorrections_src,src/usercode/MergedTrackCorrections/src,LIBRARY))
usercodeMergedTrackCorrections := self/usercode/MergedTrackCorrections
usercode/MergedTrackCorrections := usercodeMergedTrackCorrections
usercodeMergedTrackCorrections_files := $(patsubst src/usercode/MergedTrackCorrections/src/%,%,$(wildcard $(foreach dir,src/usercode/MergedTrackCorrections/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeMergedTrackCorrections_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/MergedTrackCorrections/BuildFile
usercodeMergedTrackCorrections_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities DataFormats/Math DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/HeavyIonEvent CommonTools/Utils CommonTools/UtilAlgos
usercodeMergedTrackCorrections_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeMergedTrackCorrections,usercodeMergedTrackCorrections,$(SCRAMSTORENAME_LIB),src/usercode/MergedTrackCorrections/src))
usercodeMergedTrackCorrections_PACKAGE := self/src/usercode/MergedTrackCorrections/src
ALL_PRODS += usercodeMergedTrackCorrections
usercodeMergedTrackCorrections_INIT_FUNC        += $$(eval $$(call Library,usercodeMergedTrackCorrections,src/usercode/MergedTrackCorrections/src,src_usercode_MergedTrackCorrections_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/Misc)
subdirs_src_usercode_Misc := src_usercode_Misc_python
ifeq ($(strip $(PyusercodeMisc)),)
PyusercodeMisc := self/src/usercode/Misc/python
src_usercode_Misc_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/usercode/Misc/python)
PyusercodeMisc_files := $(patsubst src/usercode/Misc/python/%,%,$(wildcard $(foreach dir,src/usercode/Misc/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyusercodeMisc_LOC_USE := self  
PyusercodeMisc_PACKAGE := self/src/usercode/Misc/python
ALL_PRODS += PyusercodeMisc
PyusercodeMisc_INIT_FUNC        += $$(eval $$(call PythonProduct,PyusercodeMisc,src/usercode/Misc/python,src_usercode_Misc_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyusercodeMisc,src/usercode/Misc/python))
endif
ALL_COMMONRULES += src_usercode_Misc_python
src_usercode_Misc_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_Misc_python,src/usercode/Misc/python,PYTHON))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/Phase1HITracking)
subdirs_src_usercode_Phase1HITracking := src_usercode_Phase1HITracking_test
ALL_COMMONRULES += src_usercode_Phase1HITracking_test
src_usercode_Phase1HITracking_test_parent := usercode/Phase1HITracking
src_usercode_Phase1HITracking_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_Phase1HITracking_test,src/usercode/Phase1HITracking/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/PhysicsTools)
subdirs_src_usercode_PhysicsTools := 
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/PixelFiducialRemover)
subdirs_src_usercode_PixelFiducialRemover := src_usercode_PixelFiducialRemover_src
ifeq ($(strip $(usercode/PixelFiducialRemover)),)
ALL_COMMONRULES += src_usercode_PixelFiducialRemover_src
src_usercode_PixelFiducialRemover_src_parent := usercode/PixelFiducialRemover
src_usercode_PixelFiducialRemover_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_PixelFiducialRemover_src,src/usercode/PixelFiducialRemover/src,LIBRARY))
usercodePixelFiducialRemover := self/usercode/PixelFiducialRemover
usercode/PixelFiducialRemover := usercodePixelFiducialRemover
usercodePixelFiducialRemover_files := $(patsubst src/usercode/PixelFiducialRemover/src/%,%,$(wildcard $(foreach dir,src/usercode/PixelFiducialRemover/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodePixelFiducialRemover_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelFiducialRemover/BuildFile
usercodePixelFiducialRemover_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/SiPixelDetId DataFormats/TrackerRecHit2D DataFormats/SiPixelCluster DataFormats/DetId DataFormats/Common
usercodePixelFiducialRemover_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodePixelFiducialRemover,usercodePixelFiducialRemover,$(SCRAMSTORENAME_LIB),src/usercode/PixelFiducialRemover/src))
usercodePixelFiducialRemover_PACKAGE := self/src/usercode/PixelFiducialRemover/src
ALL_PRODS += usercodePixelFiducialRemover
usercodePixelFiducialRemover_INIT_FUNC        += $$(eval $$(call Library,usercodePixelFiducialRemover,src/usercode/PixelFiducialRemover/src,src_usercode_PixelFiducialRemover_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/PixelTrackAnalysis)
subdirs_src_usercode_PixelTrackAnalysis := src_usercode_PixelTrackAnalysis_src src_usercode_PixelTrackAnalysis_test
ifeq ($(strip $(usercode/PixelTrackAnalysis)),)
ALL_COMMONRULES += src_usercode_PixelTrackAnalysis_src
src_usercode_PixelTrackAnalysis_src_parent := usercode/PixelTrackAnalysis
src_usercode_PixelTrackAnalysis_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_PixelTrackAnalysis_src,src/usercode/PixelTrackAnalysis/src,LIBRARY))
usercodePixelTrackAnalysis := self/usercode/PixelTrackAnalysis
usercode/PixelTrackAnalysis := usercodePixelTrackAnalysis
usercodePixelTrackAnalysis_files := $(patsubst src/usercode/PixelTrackAnalysis/src/%,%,$(wildcard $(foreach dir,src/usercode/PixelTrackAnalysis/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodePixelTrackAnalysis_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelTrackAnalysis/BuildFile
usercodePixelTrackAnalysis_LOC_USE := self  FWCore/Framework FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities DataFormats/Math DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco DataFormats/HeavyIonEvent CommonTools/Utils CommonTools/UtilAlgos SimDataFormats/TrackingAnalysis SimTracker/Records SimTracker/TrackAssociation DataFormats/RecoCandidate Geometry/TrackerGeometryBuilder
usercodePixelTrackAnalysis_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodePixelTrackAnalysis,usercodePixelTrackAnalysis,$(SCRAMSTORENAME_LIB),src/usercode/PixelTrackAnalysis/src))
usercodePixelTrackAnalysis_PACKAGE := self/src/usercode/PixelTrackAnalysis/src
ALL_PRODS += usercodePixelTrackAnalysis
usercodePixelTrackAnalysis_INIT_FUNC        += $$(eval $$(call Library,usercodePixelTrackAnalysis,src/usercode/PixelTrackAnalysis/src,src_usercode_PixelTrackAnalysis_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_usercode_PixelTrackAnalysis_test
src_usercode_PixelTrackAnalysis_test_parent := usercode/PixelTrackAnalysis
src_usercode_PixelTrackAnalysis_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_PixelTrackAnalysis_test,src/usercode/PixelTrackAnalysis/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/PixelTracksRun2010)
subdirs_src_usercode_PixelTracksRun2010 := src_usercode_PixelTracksRun2010_bin src_usercode_PixelTracksRun2010_interface src_usercode_PixelTracksRun2010_python src_usercode_PixelTracksRun2010_scripts src_usercode_PixelTracksRun2010_src src_usercode_PixelTracksRun2010_test
ifeq ($(strip $(CheckPixelTracks)),)
CheckPixelTracks_files := $(patsubst src/usercode/PixelTracksRun2010/bin/%,%,$(foreach file,CheckPixelTracks.cc,$(eval xfile:=$(wildcard src/usercode/PixelTracksRun2010/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/usercode/PixelTracksRun2010/bin/$(file). Please fix src/usercode/PixelTracksRun2010/bin/BuildFile.))))
CheckPixelTracks := self/src/usercode/PixelTracksRun2010/bin
CheckPixelTracks_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelTracksRun2010/bin/BuildFile
CheckPixelTracks_LOC_USE := self  root boost rootcintex DataFormats/FWLite FWCore/FWLite FWCore/Framework CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities DataFormats/Common DataFormats/TrackReco DataFormats/VertexReco
CheckPixelTracks_PACKAGE := self/src/usercode/PixelTracksRun2010/bin
ALL_PRODS += CheckPixelTracks
CheckPixelTracks_INIT_FUNC        += $$(eval $$(call Binary,CheckPixelTracks,src/usercode/PixelTracksRun2010/bin,src_usercode_PixelTracksRun2010_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,CheckPixelTracks,src/usercode/PixelTracksRun2010/bin))
endif
ALL_COMMONRULES += src_usercode_PixelTracksRun2010_bin
src_usercode_PixelTracksRun2010_bin_parent := usercode/PixelTracksRun2010
src_usercode_PixelTracksRun2010_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_PixelTracksRun2010_bin,src/usercode/PixelTracksRun2010/bin,BINARY))
ifeq ($(strip $(PyusercodePixelTracksRun2010)),)
PyusercodePixelTracksRun2010 := self/src/usercode/PixelTracksRun2010/python
src_usercode_PixelTracksRun2010_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/usercode/PixelTracksRun2010/python)
PyusercodePixelTracksRun2010_files := $(patsubst src/usercode/PixelTracksRun2010/python/%,%,$(wildcard $(foreach dir,src/usercode/PixelTracksRun2010/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyusercodePixelTracksRun2010_LOC_USE := self  
PyusercodePixelTracksRun2010_PACKAGE := self/src/usercode/PixelTracksRun2010/python
ALL_PRODS += PyusercodePixelTracksRun2010
PyusercodePixelTracksRun2010_INIT_FUNC        += $$(eval $$(call PythonProduct,PyusercodePixelTracksRun2010,src/usercode/PixelTracksRun2010/python,src_usercode_PixelTracksRun2010_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyusercodePixelTracksRun2010,src/usercode/PixelTracksRun2010/python))
endif
ALL_COMMONRULES += src_usercode_PixelTracksRun2010_python
src_usercode_PixelTracksRun2010_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_PixelTracksRun2010_python,src/usercode/PixelTracksRun2010/python,PYTHON))
src_usercode_PixelTracksRun2010_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/usercode/PixelTracksRun2010/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_usercode_PixelTracksRun2010_scripts,src/usercode/PixelTracksRun2010/scripts,$(SCRAMSTORENAME_BIN),*))
ifeq ($(strip $(usercode/PixelTracksRun2010)),)
ALL_COMMONRULES += src_usercode_PixelTracksRun2010_src
src_usercode_PixelTracksRun2010_src_parent := usercode/PixelTracksRun2010
src_usercode_PixelTracksRun2010_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_PixelTracksRun2010_src,src/usercode/PixelTracksRun2010/src,LIBRARY))
usercodePixelTracksRun2010 := self/usercode/PixelTracksRun2010
usercode/PixelTracksRun2010 := usercodePixelTracksRun2010
usercodePixelTracksRun2010_files := $(patsubst src/usercode/PixelTracksRun2010/src/%,%,$(wildcard $(foreach dir,src/usercode/PixelTracksRun2010/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodePixelTracksRun2010_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/PixelTracksRun2010/BuildFile
usercodePixelTracksRun2010_LOC_USE := self  DataFormats/Common DataFormats/DetId DataFormats/Math DataFormats/SiPixelDetId DataFormats/SiStripDetId DataFormats/TrackCandidate DataFormats/TrackReco DataFormats/TrackerRecHit2D DataFormats/TrackingRecHit DataFormats/TrajectorySeed DataFormats/VertexReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/PluginManager FWCore/Utilities Geometry/CommonDetUnit Geometry/CommonTopologies Geometry/Records Geometry/TrackerGeometryBuilder MagneticField/Engine MagneticField/Records TrackingTools/PatternTools RecoLocalTracker/SiStripClusterizer RecoLocalTracker/Records TrackingTools/TransientTrack TrackingTools/TrajectoryCleaning TrackingTools/TrajectoryFiltering TrackingTools/Records RecoTracker/TrackProducer RecoPixelVertexing/PixelTriplets RecoPixelVertexing/PixelTrackFitting RecoPixelVertexing/PixelLowPtUtilities SimDataFormats/GeneratorProducts RecoVertex/VertexTools CommonTools/Utils clhep
usercodePixelTracksRun2010_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodePixelTracksRun2010,usercodePixelTracksRun2010,$(SCRAMSTORENAME_LIB),src/usercode/PixelTracksRun2010/src))
usercodePixelTracksRun2010_PACKAGE := self/src/usercode/PixelTracksRun2010/src
ALL_PRODS += usercodePixelTracksRun2010
usercodePixelTracksRun2010_INIT_FUNC        += $$(eval $$(call Library,usercodePixelTracksRun2010,src/usercode/PixelTracksRun2010/src,src_usercode_PixelTracksRun2010_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_usercode_PixelTracksRun2010_test
src_usercode_PixelTracksRun2010_test_parent := usercode/PixelTracksRun2010
src_usercode_PixelTracksRun2010_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_PixelTracksRun2010_test,src/usercode/PixelTracksRun2010/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/SiStripCMNAnalyzer)
subdirs_src_usercode_SiStripCMNAnalyzer := src_usercode_SiStripCMNAnalyzer_test src_usercode_SiStripCMNAnalyzer_bin src_usercode_SiStripCMNAnalyzer_src
ifeq ($(strip $(ClusterOut)),)
ClusterOut_files := $(patsubst src/usercode/SiStripCMNAnalyzer/bin/%,%,$(foreach file,ClusterOut.cc,$(eval xfile:=$(wildcard src/usercode/SiStripCMNAnalyzer/bin/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/usercode/SiStripCMNAnalyzer/bin/$(file). Please fix src/usercode/SiStripCMNAnalyzer/bin/BuildFile.))))
ClusterOut := self/src/usercode/SiStripCMNAnalyzer/bin
ClusterOut_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/SiStripCMNAnalyzer/bin/BuildFile
ClusterOut_LOC_USE := self  root boost rootcintex DataFormats/FWLite FWCore/FWLite FWCore/Framework CommonTools/Utils PhysicsTools/FWLite PhysicsTools/Utilities DataFormats/SiStripCluster DataFormats/Common
ClusterOut_PACKAGE := self/src/usercode/SiStripCMNAnalyzer/bin
ALL_PRODS += ClusterOut
ClusterOut_INIT_FUNC        += $$(eval $$(call Binary,ClusterOut,src/usercode/SiStripCMNAnalyzer/bin,src_usercode_SiStripCMNAnalyzer_bin,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_BIN),bin,$(SCRAMSTORENAME_LOGS)))
else
$(eval $(call MultipleWarningMsg,ClusterOut,src/usercode/SiStripCMNAnalyzer/bin))
endif
ALL_COMMONRULES += src_usercode_SiStripCMNAnalyzer_bin
src_usercode_SiStripCMNAnalyzer_bin_parent := usercode/SiStripCMNAnalyzer
src_usercode_SiStripCMNAnalyzer_bin_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_SiStripCMNAnalyzer_bin,src/usercode/SiStripCMNAnalyzer/bin,BINARY))
ifeq ($(strip $(usercode/SiStripCMNAnalyzer)),)
ALL_COMMONRULES += src_usercode_SiStripCMNAnalyzer_src
src_usercode_SiStripCMNAnalyzer_src_parent := usercode/SiStripCMNAnalyzer
src_usercode_SiStripCMNAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_usercode_SiStripCMNAnalyzer_src,src/usercode/SiStripCMNAnalyzer/src,LIBRARY))
usercodeSiStripCMNAnalyzer := self/usercode/SiStripCMNAnalyzer
usercode/SiStripCMNAnalyzer := usercodeSiStripCMNAnalyzer
usercodeSiStripCMNAnalyzer_files := $(patsubst src/usercode/SiStripCMNAnalyzer/src/%,%,$(wildcard $(foreach dir,src/usercode/SiStripCMNAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
usercodeSiStripCMNAnalyzer_BuildFile    := $(WORKINGDIR)/cache/bf/src/usercode/SiStripCMNAnalyzer/BuildFile
usercodeSiStripCMNAnalyzer_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet FWCore/MessageLogger FWCore/Utilities DataFormats/Common DataFormats/FEDRawData DataFormats/SiStripDetId CondFormats/DataRecord CondFormats/SiStripObjects CalibFormats/SiStripObjects CalibTracker/Records RecoLocalTracker/SiStripZeroSuppression RecoLocalTracker/SiStripClusterizer FWCore/ServiceRegistry CommonTools/UtilAlgos SimTracker/SiStripDigitizer DataFormats/SiStripCluster
usercodeSiStripCMNAnalyzer_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,usercodeSiStripCMNAnalyzer,usercodeSiStripCMNAnalyzer,$(SCRAMSTORENAME_LIB),src/usercode/SiStripCMNAnalyzer/src))
usercodeSiStripCMNAnalyzer_PACKAGE := self/src/usercode/SiStripCMNAnalyzer/src
ALL_PRODS += usercodeSiStripCMNAnalyzer
usercodeSiStripCMNAnalyzer_INIT_FUNC        += $$(eval $$(call Library,usercodeSiStripCMNAnalyzer,src/usercode/SiStripCMNAnalyzer/src,src_usercode_SiStripCMNAnalyzer_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
ALL_COMMONRULES += src_usercode_SiStripCMNAnalyzer_test
src_usercode_SiStripCMNAnalyzer_test_parent := usercode/SiStripCMNAnalyzer
src_usercode_SiStripCMNAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_usercode_SiStripCMNAnalyzer_test,src/usercode/SiStripCMNAnalyzer/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/SimG4Core)
subdirs_src_usercode_SimG4Core := 
ALL_PACKAGES += $(patsubst src/%,%,src/usercode/hackedSiStripDigitizer)
subdirs_src_usercode_hackedSiStripDigitizer := 
ALL_PACKAGES += $(patsubst src/%,%,src/myAnalyzers/PiLambda)
subdirs_src_myAnalyzers_PiLambda := src_myAnalyzers_PiLambda_src src_myAnalyzers_PiLambda_test
ALL_COMMONRULES += src_myAnalyzers_PiLambda_test
src_myAnalyzers_PiLambda_test_parent := myAnalyzers/PiLambda
src_myAnalyzers_PiLambda_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_PiLambda_test,src/myAnalyzers/PiLambda/test,TEST))
ALL_PACKAGES += $(patsubst src/%,%,src/myAnalyzers/V0RecoAnalyzer)
subdirs_src_myAnalyzers_V0RecoAnalyzer := src_myAnalyzers_V0RecoAnalyzer_python src_myAnalyzers_V0RecoAnalyzer_test src_myAnalyzers_V0RecoAnalyzer_src
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
ALL_COMMONRULES += src_myAnalyzers_V0RecoAnalyzer_test
src_myAnalyzers_V0RecoAnalyzer_test_parent := myAnalyzers/V0RecoAnalyzer
src_myAnalyzers_V0RecoAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myAnalyzers_V0RecoAnalyzer_test,src/myAnalyzers/V0RecoAnalyzer/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/myFilters)
subdirs_src_myFilters = src_myFilters_V0CandFilter
ALL_PACKAGES += $(patsubst src/%,%,src/myFilters/V0CandFilter)
subdirs_src_myFilters_V0CandFilter := src_myFilters_V0CandFilter_src src_myFilters_V0CandFilter_test src_myFilters_V0CandFilter_python
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
ALL_COMMONRULES += src_myFilters_V0CandFilter_test
src_myFilters_V0CandFilter_test_parent := myFilters/V0CandFilter
src_myFilters_V0CandFilter_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_myFilters_V0CandFilter_test,src/myFilters/V0CandFilter/test,TEST))
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/myProducers)
subdirs_src_myProducers = src_myProducers_V0CandProducer src_myProducers_V0TrackFilter
ALL_PACKAGES += $(patsubst src/%,%,src/myProducers/V0CandProducer)
subdirs_src_myProducers_V0CandProducer := src_myProducers_V0CandProducer_python src_myProducers_V0CandProducer_src
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
ALL_PACKAGES += $(patsubst src/%,%,src/myProducers/V0TrackFilter)
subdirs_src_myProducers_V0TrackFilter := src_myProducers_V0TrackFilter_doc src_myProducers_V0TrackFilter_interface src_myProducers_V0TrackFilter_python src_myProducers_V0TrackFilter_src src_myProducers_V0TrackFilter_test
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
ALL_SUBSYSTEMS+=$(patsubst src/%,%,src/GeneratorInterface)
subdirs_src_GeneratorInterface = src_GeneratorInterface_HijingInterface src_GeneratorInterface_AnaHijing
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
subdirs_src_GeneratorInterface_HijingInterface := src_GeneratorInterface_HijingInterface_plugins src_GeneratorInterface_HijingInterface_python src_GeneratorInterface_HijingInterface_src src_GeneratorInterface_HijingInterface_test
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
