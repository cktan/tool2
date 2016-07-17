CXXFILES= TestBufferedSocketReader.cpp \
	TestChecksum.cpp \
	TestException.cpp \
	TestGetHANamenodes.cpp \
	TestLeaseRenewer.cpp \
	TestLocatedBlocks.cpp \
	TestLruMap.cpp \
	TestRpcChannel.cpp \
	TestRpcClient.cpp \
	TestSessionConfig.cpp \
	TestSocket.cpp \
	TestXmlConfig.cpp \
	UnitTestInputStream.cpp \
	UnitTestMain.cpp \
	UnitTestOutputStream.cpp


OBJS = $(CXXFILES:.cpp=.o)

# CXXFLAGS += -isystem
CXXFLAGS += -I${TOOLCHAIN_DIR}/installed/include
CXXFLAGS += -I../../src -I../../src/common -I../../mock
CXXFLAGS += -std=c++11
CXXFLAGS += -pthread
CXXFLAGS += -DUSER='"${USER}"' -DHDFS_SUPERUSER='"${USER}"'

LDFLAGS += ../../src/libhdfs3.a 
LDFLAGS += -L$(TOOLCHAIN_DIR)/installed/lib -l gtest 
LDFLAGS += `../../../installed/bin/krb5-config --libs`  -lkrb5support
LDFLAGS += `pkg-config --libs grpc`
LDFLAGS += `pkg-config --libs grpc++`
LDFLAGS += -lprotobuf -ldl
LDFLAGS += -lgsasl -luuid
LDFLAGS += -L../../../installed/lib -l xml2 -lz  -lresolv

unit: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)
