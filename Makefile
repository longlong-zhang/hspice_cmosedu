
SUBDIRS := $(wildcard */.)

clean:
	@for dir in $(SUBDIRS); do \
		echo "processing folder $$dir"; \
		cd $$dir; \
		rm -rf *.tr0 *.st0 *.ic0 sx_crash.sx sxcmd*; \
		cd ..; \
	done

