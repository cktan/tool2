CXXFILES = Datanode.cpp \
	LocatedBlocks.cpp \
	NamenodeImpl.cpp \
	NamenodeInfo.cpp \
	NamenodeProxy.cpp

OBJ = $(CXXFILES:.cpp=.o)

CXXFLAGS += -I/home/cktan/p/tool2/installed/include -I../common -I.. -I../proto
CXXFLAGS += -Wall -msse4.2 -std=c++11 -g 
CXXFLAGS += -O0 
#CXXFLAGS += -O2 -g -DNDEBUG 


all: $(OBJ)


clean: 
	rm -f *.o 

