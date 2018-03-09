dummy:
	rm -rf $@
	mkdir $@
	cp roots.mk dummy/
	cd dummy && $(MAKE) -f roots.mk && cd ..
.PHONY: dummy

test: dummy
	ruby test.rb
.PHONY: test

test-incremental:
	cp roots.mk dummy/
	cd dummy && $(MAKE) -f roots.mk && cd ..
	ruby test.rb
.PHONY: test-incremental
