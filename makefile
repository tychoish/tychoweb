BUILDDIR = build
STAGEDIR = $(BUILDDIR)/output

include makefile.docs

help:
	@echo you can\'t be helped.

push:stage
        rsync -arz $(STAGEDIR)/ tychoish@foucault.tychoish.net:/home/tychouish/public/tychoweb

stage:$(STAGEDIR)

$(BUILDDIR)/dirhtml:dirhtml
$(BUILDDIR)/publish:$(BUILDDIR)/dirhtml
	mkdir -p $@
	cp -R $</* $@
	touch $(CURDIR)/source/index.html
