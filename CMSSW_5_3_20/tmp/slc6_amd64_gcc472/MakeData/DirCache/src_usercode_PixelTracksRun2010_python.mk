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
