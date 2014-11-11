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
