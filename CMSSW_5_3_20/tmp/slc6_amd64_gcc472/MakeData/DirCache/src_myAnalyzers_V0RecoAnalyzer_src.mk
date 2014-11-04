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
