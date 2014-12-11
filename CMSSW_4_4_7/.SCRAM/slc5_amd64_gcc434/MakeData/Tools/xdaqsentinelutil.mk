xdaqsentinelutil             := xdaqsentinelutil
ALL_TOOLS      += xdaqsentinelutil
xdaqsentinelutil_LOC_LIB := sentinelutils
xdaqsentinelutil_EX_LIB  := $(xdaqsentinelutil_LOC_LIB)
xdaqsentinelutil_LOC_USE := xdaq
xdaqsentinelutil_EX_USE  := $(xdaqsentinelutil_LOC_USE)
xdaqsentinelutil_INIT_FUNC := $$(eval $$(call ProductCommonVars,xdaqsentinelutil,,,xdaqsentinelutil))

