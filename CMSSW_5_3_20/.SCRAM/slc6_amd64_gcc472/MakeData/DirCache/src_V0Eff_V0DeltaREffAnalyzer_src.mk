ifeq ($(strip $(V0Eff/V0DeltaREffAnalyzer)),)
ALL_COMMONRULES += src_V0Eff_V0DeltaREffAnalyzer_src
src_V0Eff_V0DeltaREffAnalyzer_src_parent := V0Eff/V0DeltaREffAnalyzer
src_V0Eff_V0DeltaREffAnalyzer_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_V0Eff_V0DeltaREffAnalyzer_src,src/V0Eff/V0DeltaREffAnalyzer/src,LIBRARY))
V0EffV0DeltaREffAnalyzer := self/V0Eff/V0DeltaREffAnalyzer
V0Eff/V0DeltaREffAnalyzer := V0EffV0DeltaREffAnalyzer
V0EffV0DeltaREffAnalyzer_files := $(patsubst src/V0Eff/V0DeltaREffAnalyzer/src/%,%,$(wildcard $(foreach dir,src/V0Eff/V0DeltaREffAnalyzer/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
V0EffV0DeltaREffAnalyzer_LOC_USE :=  
V0EffV0DeltaREffAnalyzer_PACKAGE := self/src/V0Eff/V0DeltaREffAnalyzer/src
ALL_PRODS += V0EffV0DeltaREffAnalyzer
V0EffV0DeltaREffAnalyzer_INIT_FUNC        += $$(eval $$(call Library,V0EffV0DeltaREffAnalyzer,src/V0Eff/V0DeltaREffAnalyzer/src,src_V0Eff_V0DeltaREffAnalyzer_src,$(),,$(),$()))
endif
