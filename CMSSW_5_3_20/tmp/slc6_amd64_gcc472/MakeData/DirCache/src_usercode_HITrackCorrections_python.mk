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
