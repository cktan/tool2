.NOTPARALLEL:

DIRS = proto common server client network rpc
BUILDDIRS = $(DIRS:%=build-%)
CLEANDIRS = $(DIRS:%=clean-%)
SUBOBJS = proto/subobj.o common/subobj.o server/subobj.o \
	client/subobj.o network/subobj.o rpc/subobj.o

all: libhdfs3.a

libhdfs3.a: $(BUILDDIRS)
	ar -rcs $@ $(SUBOBJS)

$(DIRS): $(BUILDDIRS)

$(BUILDDIRS):
	$(MAKE) -C $(@:build-%=%)

clean: $(CLEANDIRS)
	rm -f libhdfs3.a 

$(CLEANDIRS):
	$(MAKE) -C $(@:clean-%=%) clean


.PHONY: subdirs $(DIRS)
.PHONY: subdirs $(BUILDDIRS)
.PHONY: subdirs $(CLEANDIRS)

