
PDFLATEX=pdflatex
LATEXFLAGS=-file-line-error -halt-on-error -interaction errorstopmode --enable-write18

all: pdf

SRC_LATEX=$(wildcard *.tex)

.PHONY:check
check:
	aspell --mode=tex --lang=en_US --encoding=UTF-8 -c ansible.tex

.PHONY:clean
clean:
	rm -rf *.aux *.nav *.pdf *.vrb *.log *.out *.snm *.toc


pdf: ${SRC_LATEX}
	$(PDFLATEX) $(LATEXFLAGS) $<

# vim: noexpandtab shiftwidth=8 softtabstop=0
