COMPILER=lualatex --interaction=batchmode
BIB_COMPILER=biber -q
LATEX_SRC=$(wildcard *.latex)
BIB_SRC=$(wildcard *.bib)
PIE=perl -pi -e

TEXTMP=$(wildcard *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc)

all: latex

latex:
	rm -v $(patsubst %.latex,%.pdf,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(BIB_COMPILER) $(patsubst %.latex,%,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(COMPILER) $(LATEX_SRC)
	ls -lh $(patsubst %.latex,%.pdf,$(LATEX_SRC))

clean:
ifneq ($(TEXTMP), )
	rm $(TEXTMP)
endif
