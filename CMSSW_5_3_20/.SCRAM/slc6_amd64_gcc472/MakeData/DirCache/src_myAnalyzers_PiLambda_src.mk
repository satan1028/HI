ifeq ($(strip $(myAnalyzers/PiLambda)),)
ALL_COMMONRULES += src_myAnalyzers_PiLambda_src
src_myAnalyzers_PiLambda_src_parent := myAnalyzers/PiLambda
src_myAnalyzers_PiLambda_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_myAnalyzers_PiLambda_src,src/myAnalyzers/PiLambda/src,LIBRARY))
myAnalyzersPiLambda := self/myAnalyzers/PiLambda
myAnalyzers/PiLambda := myAnalyzersPiLambda
myAnalyzersPiLambda_files := $(patsubst src/myAnalyzers/PiLambda/src/%,%,$(wildcard $(foreach dir,src/myAnalyzers/PiLambda/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
myAnalyzersPiLambda_LOC_USE :=  
myAnalyzersPiLambda_PACKAGE := self/src/myAnalyzers/PiLambda/src
ALL_PRODS += myAnalyzersPiLambda
myAnalyzersPiLambda_INIT_FUNC        += $$(eval $$(call Library,myAnalyzersPiLambda,src/myAnalyzers/PiLambda/src,src_myAnalyzers_PiLambda_src,$(),,$(),$()))
endif
