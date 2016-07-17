CXXFILES= FunctionTestMain.cpp \
	TestCInterface.cpp \
	TestFileSystem.cpp \
	TestInputStream.cpp \
	TestOutputStream.cpp

OBJS = $(CXXFILES:.cpp=.o)

# CXXFLAGS += -isystem
CXXFLAGS += -I${TOOLCHAIN_DIR}/installed/include
CXXFLAGS += -I../../src -I../../src/common -I../../mock
CXXFLAGS += -std=c++11
CXXFLAGS += -pthread
CXXFLAGS += -DUSER='"cktan"' -DHDFS_SUPERUSER='"hduser"'

LDFLAGS += ../../src/libhdfs3.a 
LDFLAGS += -L$(TOOLCHAIN_DIR)/installed/lib -l gtest 
LDFLAGS += `../../../installed/bin/krb5-config --libs`  -lkrb5support
LDFLAGS += `pkg-config --libs grpc`
LDFLAGS += `pkg-config --libs grpc++`
LDFLAGS += -lprotobuf -ldl
LDFLAGS += -lgsasl -luuid
LDFLAGS += -L../../../installed/lib -l xml2 -lz  -lresolv

function: $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

clean: 
	rm -f $(OBJS) function
