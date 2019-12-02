dummy:
	rm -rf $@
	mkdir $@
	cp elm.mk dummy/
	node --version
	npm --version
	npm install -g npm
	cd dummy && $(MAKE) all prod tests --jobs=4 -f elm.mk --ignore-errors && cd ..
.PHONY: dummy

test: dummy
	ruby test.rb
.PHONY: test

test-incremental:
	cp elm.mk dummy/
	cd dummy && $(MAKE) all prod tests --jobs=4 -f elm.mk && cd ..
	ruby test.rb
.PHONY: test-incremental
