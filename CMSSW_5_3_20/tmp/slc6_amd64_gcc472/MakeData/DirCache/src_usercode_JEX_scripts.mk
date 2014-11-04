src_usercode_JEX_scripts_files := $(filter-out \#% %\#,$(notdir $(wildcard $(foreach dir,$(LOCALTOP)/src/usercode/JEX/scripts,$(dir)/*))))
$(eval $(call Src2StoreCopy,src_usercode_JEX_scripts,src/usercode/JEX/scripts,$(SCRAMSTORENAME_BIN),*))
