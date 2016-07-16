CXXFILES = DataTransferProtocolSender.cpp \
	DirectoryIterator.cpp \
	FileSystem.cpp \
	FileSystemImpl.cpp \
	FileSystemKey.cpp \
	Hdfs.cpp \
	InputStream.cpp \
	InputStreamImpl.cpp \
	KerberosName.cpp \
	LeaseRenewer.cpp \
	LocalBlockReader.cpp \
	OutputStream.cpp \
	OutputStreamImpl.cpp \
	Packet.cpp \
	PacketHeader.cpp \
	PacketPool.cpp \
	PeerCache.cpp \
	Permission.cpp \
	Pipeline.cpp \
	ReadShortCircuitInfo.cpp \
	RemoteBlockReader.cpp \
	Token.cpp \
	UserInfo.cpp

OBJ = $(CXXFILES:.cpp=.o)

CXXFLAGS += -I/home/cktan/p/tool2/installed/include 
CXXFLAGS += -I/home/cktan/p/tool2/installed/include/libxml2
CXXFLAGS += -I../common -I.. -I../proto
CXXFLAGS += -Wall -msse4.2 -std=c++11 -g 
CXXFLAGS += -O0 
#CXXFLAGS += -O2 -g -DNDEBUG 


all: $(OBJ)


clean: 
	rm -f *.o 

