qtbase             := qtbase
ALL_TOOLS      += qtbase
qtbase_LOC_INCLUDE := /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/qt/4.6.3-cms/include /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/qt/4.6.3-cms/include/Qt /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/qt/4.6.3-cms/include/QtCore /cvmfs/cms.cern.ch/slc5_amd64_gcc434/external/qt/4.6.3-cms/include/QtXml
qtbase_EX_INCLUDE  := $(qtbase_LOC_INCLUDE)
qtbase_LOC_LIB := QtCore QtXml
qtbase_EX_LIB  := $(qtbase_LOC_LIB)
qtbase_LOC_USE := zlib
qtbase_EX_USE  := $(qtbase_LOC_USE)
qtbase_LOC_FLAGS_CPPDEFINES  := -DQT_ALTERNATE_QTSMANIP -DQT_CLEAN_NAMESPACE -DQT_THREAD_SUPPORT
qtbase_EX_FLAGS_CPPDEFINES   := $(qtbase_LOC_FLAGS_CPPDEFINES)
qtbase_INIT_FUNC := $$(eval $$(call ProductCommonVars,qtbase,,,qtbase))

