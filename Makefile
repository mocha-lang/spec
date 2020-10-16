PANDOC=pandoc
SOURCESDIR=./sources
SOURCES=$(wildcard $(SOURCESDIR)/*.md)
RESOURCESDIR=./resources
TEMPLATESDIR=./templates
TEMPLATE=$(TEMPLATESDIR)/eisvogel.latex
OUTNAME=reference.pdf
RM=rm -f

.PHONY: clean

$(OUTNAME): $(SOURCES) $(TEMPLATE) 
	$(PANDOC) \
		-s $(SOURCES) \
		--template $(TEMPLATE) \
		--resource-path $(RESOURCESDIR) \
		--listings \
		--toc \
		-o $(OUTNAME)

clean:
	$(RM) *.pdf

