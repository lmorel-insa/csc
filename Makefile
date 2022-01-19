OUTDIR= output
SRC= $(wildcard *.md)
PDF= $(addprefix $(OUTDIR)/,$(SRC:.md=.pdf))
HTML= $(addprefix  $(OUTDIR)/,$(SRC:.md=.html))


all: $(PDF) $(HTML)

pdf: $(PDF)

html: $(HTML)

directories: $(OUTDIR)

$(OUTDIR): 
	mkdir $(OUTDIR)

$(OUTDIR)/%.html: %.md $(OUTDIR)
	pandoc $< -o $@ -s

$(OUTDIR)/%.pdf: $(OUTDIR)/%.html
	wkhtmltopdf $< $@

td2: $(OUTDIR)/td2-jdr.pdf


clean:
	\rm -rf *.html *.pdf $(OUTDIR)


