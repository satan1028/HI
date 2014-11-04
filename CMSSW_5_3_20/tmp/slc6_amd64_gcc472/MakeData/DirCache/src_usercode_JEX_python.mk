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
