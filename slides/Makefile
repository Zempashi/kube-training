
PDFLATEX=pdflatex
LATEXFLAGS=-file-line-error -halt-on-error -interaction errorstopmode --enable-write18

SRC_LATEX=$(wildcard *.tex)
PDF=$(patsubst %.tex,%.pdf,$(SRC_LATEX))

all: $(PDF)

.PHONY:check
check:
	aspell --mode=tex --lang=en_US --encoding=UTF-8 -c ansible.tex

.PHONY:clean
clean:
	rm -rf *.aux *.nav *.pdf *.vrb *.log *.out *.snm *.toc


%: %.tex

%.pdf: %.tex
	$(PDFLATEX) $(LATEXFLAGS) $<

docker-intro: docker-intro.pdf

# vim: noexpandtab shiftwidth=8 softtabstop=0
