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
