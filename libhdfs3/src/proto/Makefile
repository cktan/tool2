GENCXX = ClientDatanodeProtocol.pb.cc \
	ClientNamenodeProtocol.pb.cc \
	datatransfer.pb.cc \
	hdfs.pb.cc \
	IpcConnectionContext.pb.cc \
	ProtobufRpcEngine.pb.cc \
	RpcHeader.pb.cc \
	Security.pb.cc

GENH = $(GENCXX:.cc=.h)
GEN = $(GENCXX) $(GENH)


all: $(GEN)

clean:
	rm -f $(GEN) *.o

%.pb.cc %.pb.h: ../proto/%.proto
	protoc -I../proto --cpp_out=. $<
