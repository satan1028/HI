ifeq ($(strip $(PydNchdetaPythiaMC)),)
PydNchdetaPythiaMC := self/src/dNchdeta/PythiaMC/python
src_dNchdeta_PythiaMC_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/dNchdeta/PythiaMC/python)
PydNchdetaPythiaMC_files := $(patsubst src/dNchdeta/PythiaMC/python/%,%,$(wildcard $(foreach dir,src/dNchdeta/PythiaMC/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PydNchdetaPythiaMC_LOC_USE := self  
PydNchdetaPythiaMC_PACKAGE := self/src/dNchdeta/PythiaMC/python
ALL_PRODS += PydNchdetaPythiaMC
PydNchdetaPythiaMC_INIT_FUNC        += $$(eval $$(call PythonProduct,PydNchdetaPythiaMC,src/dNchdeta/PythiaMC/python,src_dNchdeta_PythiaMC_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PydNchdetaPythiaMC,src/dNchdeta/PythiaMC/python))
endif
ALL_COMMONRULES += src_dNchdeta_PythiaMC_python
src_dNchdeta_PythiaMC_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_dNchdeta_PythiaMC_python,src/dNchdeta/PythiaMC/python,PYTHON))
