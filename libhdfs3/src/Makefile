.NOTPARALLEL:

DIRS = proto common server client network rpc
BUILDDIRS = $(DIRS:%=build-%)
CLEANDIRS = $(DIRS:%=clean-%)
SUBOBJS = proto/subobj.o common/subobj.o server/subobj.o \
	client/subobj.o network/subobj.o rpc/subobj.o

all: libhdfs3.a

libhdfs3.a: $(BUILDDIRS)
	ar -rv $@ $(SUBOBJS)

$(DIRS): $(BUILDDIRS)

$(BUILDDIRS):
	$(MAKE) -C $(@:build-%=%)

clean: $(CLEANDIRS)

$(CLEANDIRS):
	$(MAKE) -C $(@:clean-%=%) clean


.PHONY: subdirs $(DIRS)
.PHONY: subdirs $(BUILDDIRS)
.PHONY: subdirs $(CLEANDIRS)

