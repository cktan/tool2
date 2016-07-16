
GENCXX = ClientDatanodeProtocol.pb.cc \
	ClientNamenodeProtocol.pb.cc \
	datatransfer.pb.cc \
	hdfs.pb.cc \
	IpcConnectionContext.pb.cc \
	ProtobufRpcEngine.pb.cc \
	RpcHeader.pb.cc \
	Security.pb.cc

GENH = $(GENCXX:.cc=.h)
GENFILES = $(GENCXX) $(GENH)
OBJS = $(GENCXX:.cc=.o)

%.pb.cc %.pb.h: ../proto/%.proto
	protoc -I../proto --cpp_out=. $<

include ../src.mk

