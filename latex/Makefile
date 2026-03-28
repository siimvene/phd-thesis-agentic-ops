# Makefile for TalTech PhD Thesis
# Siim Vene, 2026

MAIN = thesis
LATEX = pdflatex
BIBTEX = bibtex

.PHONY: all clean distclean view

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex TTUPhD.cls references.bib $(wildcard chapters/*.tex)
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

quick:
	$(LATEX) $(MAIN)

clean:
	rm -f *.aux *.log *.bbl *.blg *.toc *.lof *.lot *.out *.fls *.fdb_latexmk
	rm -f chapters/*.aux

distclean: clean
	rm -f $(MAIN).pdf

view: $(MAIN).pdf
	xdg-open $(MAIN).pdf 2>/dev/null || open $(MAIN).pdf

# Watch mode (requires latexmk)
watch:
	latexmk -pvc -pdf $(MAIN)
