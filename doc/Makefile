SVG_FIGS = $(wildcard figs/*.svg)
PNG_FIGS = $(SVG_FIGS:.svg=.png)
PDF_FIGS = $(SVG_FIGS:.svg=.pdf)

TARGETS = \
	${PNG_FIGS} \
	${PDF_FIGS} \


all: ${TARGETS}

clean:
	touch ${TARGETS}
	rm ${TARGETS}

mrproper: clean
	touch dummy~ figs/dummy~
	rm *~ figs/*~


figs/%.png: figs/%.svg
	inkscape -z --export-png=$@ --export-area-page $<

figs/%.pdf: figs/%.svg
	inkscape -z --export-pdf=$@ --export-area-drawing $<

