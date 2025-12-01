MODULES := $(wildcard classes/*)
MODULES_CLEAN := $(addsuffix .clean, $(MODULES))

.PHONY: all clean $(MODULES)

all: $(MODULES)

$(MODULES):
	$(MAKE) -C $@

clean: $(MODULES_CLEAN)

$(MODULES_CLEAN):
	$(MAKE) -C $(basename $@) clean
