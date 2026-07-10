MAIN = main
LATEX = xelatex
BIBER = biber

.PHONY: all clean watch

all: pdf

pdf:
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

clean:
	rm -f $(MAIN).{aux,log,out,toc,lof,lot,pdf,bbl,blg,idx,ilg,ind}
	rm -f sections/*.aux

watch:
	@echo "Rebuilding on change (requires inotify-tools)..."
	@while inotifywait -e close_write,modify -r sections/ main.tex preamble.tex; do \
		$(MAKE) pdf; \
	done
