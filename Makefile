all: main.pdf thesis.pdf abstract.pdf abstract_czech.pdf

main.pdf: thesis.pdf
	cp thesis.pdf main.pdf

thesis.xmpdata: abstract_text.tex thesis.tex abstract.xmpdata thesis_xmpdata.sh
	bash thesis_xmpdata.sh

# LaTeX must be run multiple times to get references right
thesis.pdf: thesis.tex $(wildcard *.tex) $(wildcard */*.tex) bibliography.bib thesis.xmpdata figures/*
	pdflatex $<
	bibtex thesis
	pdflatex $<
	pdflatex $<

abstract.pdf: abstract.tex abstract.xmpdata
	pdflatex $<

abstract_czech.pdf: abstract_czech.tex abstract_czech.xmpdata
	pdflatex $<

clean:
	rm -f *.log *.dvi *.aux *.toc *.lof *.lot *.out *.bbl *.blg *.xmpi
	rm -f thesis.pdf abstract.pdf main.pdf
	rm thesis.xmpdata

overleaf: all
	git fetch overleaf
	git merge overleaf/master -m 'review: overleaf'
	git push overleaf
	git push

.PHONY: overleaf clean all
