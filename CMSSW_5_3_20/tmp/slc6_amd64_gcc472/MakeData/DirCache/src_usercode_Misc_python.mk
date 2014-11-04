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
