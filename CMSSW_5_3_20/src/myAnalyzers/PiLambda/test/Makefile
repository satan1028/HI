ROOTCFLAGS    = $(shell $(ROOTSYS)/bin/root-config --cflags)
ROOTLIBS      = $(shell $(ROOTSYS)/bin/root-config --libs)
ROOTGLIBS     = $(shell $(ROOTSYS)/bin/root-config --glibs)
MYLIBS        = /usr/users/eluiggi/bin/lib
MYINC         = /usr/users/eluiggi/bin/include

#######################################
# -- DEFINE ARCH to something sensible!
#######################################
 
#
CXX           = g++
CXXFLAGS      = -g -Wall -fPIC
LD            = g++
LDFLAGS       = -g
SOFLAGS       = -shared


CXXFLAGS      += $(ROOTCFLAGS) -I$(MYINC)
LIBS           = $(ROOTLIBS) 

NGLIBS         = $(ROOTGLIBS) -lMinuit
NGLIBS        += -L$(MYLIBS) -lconfigParser

GLIBS          = $(filter-out -lNew, $(NGLIBS))

doAn: driveAn.o seleXiData.o
	$(CXX) $(CXXFLAGS) -c $<
	$(LD) $(LDFLAGS) -o doAn driveAn.o seleXiData.o $(GLIBS)

seleXiData.o: seleXiData.C seleXiData.h
	$(CXX) $(CXXFLAGS) -c seleXiData.C

driveAn.o: driveAn.C seleXiData.h
	$(CXX) $(CXXFLAGS) -c driveAn.C
	
doEff: driveEff.o seleXiMC.o
	$(CXX) $(CXXFLAGS) -c $<
	$(LD) $(LDFLAGS) -o doEff driveEff.o seleXiMC.o $(GLIBS)

seleXiMC.o: seleXiMC.C seleXiMC.h
	$(CXX) $(CXXFLAGS) -c seleXiMC.C

driveEff.o: driveEff.C seleXiMC.o
	$(CXX) $(CXXFLAGS) -c driveEff.C
