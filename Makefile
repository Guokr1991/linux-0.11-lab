include Makefile.head

all: Image

Image:
	$(Q)(cd $(LINUX_SRC); make $@)

clean:
	$(Q)(cd $(ROOTFS_DIR); make $@)
	$(Q)(cd $(CALLGRAPH_DIR); make $@)
	$(Q)(cd $(LINUX_SRC); make $@)
	$(Q)rm -rf bochsout.txt

distclean: clean
	$(Q)(cd $(LINUX_SRC); make $@)

# Test on emulators with different prebuilt rootfs
include Makefile.emu

# Tags for source code reading
include Makefile.tags

# For Call graph generation
include Makefile.cg

# For help
include Makefile.help
