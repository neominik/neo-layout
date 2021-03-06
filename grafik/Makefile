EBENEN=$(foreach i, 1 1Caps 2 2Caps 3 4 5 6, tastatur_neo_Ebene${i}.svg)
EBENENSVG=$(foreach file, ${EBENEN}, tastatur3d/${file})
HAUPT=$(foreach file, ${EBENEN}, tastatur3d/hauptfeld/${file})
ZIFFERN=$(foreach file, ${EBENEN}, tastatur3d/ziffernfeld/${file})
HAUPTZIFFERN=$(foreach file, ${EBENEN}, tastatur3d/haupt_ziffern_feld/${file})
EBENENPDF=$(addsuffix .pdf,$(basename ${EBENENSVG}))
EBENENPNG=$(addsuffix .png,$(basename ${EBENENSVG} ${HAUPT} ${ZIFFERN} ${HAUPTZIFFERN}))

SVGFILES=$(filter-out ./tastatur3d/tastatur_neo_%.svg, $(shell find -name "*.svg")) ref2svg/ref2svg.svg
PDFFILES=$(filter-out ./promotion-material/Flyer-fs/neo_logo.pdf, $(addsuffix .pdf,$(basename ${SVGFILES})))
PNGFILES=$(addsuffix .png,$(basename ${SVGFILES}))

default: svg pdf png
ref2svg/ref2svg.svg: ref2svg/ref2svg.pl ../A-REFERENZ-A/neo20.txt
	cd ref2svg/; \
	./ref2svg.pl > ref2svg.svg
svg: ref2svg/ref2svg.svg
pdf: ${PDFFILES} ${EBENENPDF} svg
png: ${PNGFILES} ${EBENENPNG} www svg
www: $(addsuffix .png,$(basename $(shell find ../www -name "*.svg")))

clean: cleansvg cleanpng cleanpdf

cleanebenen:
	rm -f ${EBENENSVG} ${EBENENPNG} ${EBENENPDF}
	$(foreach dir, hauptfeld ziffernfeld haupt_ziffern_feld, if [ -d tastatur3d/${dir} ];then rmdir tastatur3d/${dir}; fi;)

cleansvg:
	rm -f ref2svg/ref2svg.svg

cleanpng: cleanebenen
	rm -f ${PNGFILES}

cleanpdf:
	rm -f ${PDFFILES}

.SECONDARY:

tastatur3d/tastatur_neo_Ebene%.svg: tastatur3d/tastatur_neo_alle_Ebenen.svg
	/bin/echo -e '/inkscape:label="Ebene $*"\n.+1\ns/none/inline/g\nw $@'|ed $<

tastatur3d/hauptfeld/%.png: tastatur3d/%.svg
	mkdir -p  tastatur3d/hauptfeld
	inkscape --without-gui --export-id="Haupttastaturfeld" --export-png=$@ -h200 tastatur3d/$*.svg
	optipng $@

tastatur3d/ziffernfeld/%.png: tastatur3d/%.svg
	mkdir -p tastatur3d/ziffernfeld
	inkscape --without-gui --export-id="Ziffernblock" --export-png=$@ -h200 tastatur3d/$*.svg
	optipng $@

tastatur3d/haupt_ziffern_feld/%.png: tastatur3d/hauptfeld/%.png tastatur3d/ziffernfeld/%.png
	mkdir -p tastatur3d/haupt_ziffern_feld
	convert -splice 20x0 -background transparent -colors 256 -type Palette +dither -alpha off -alpha on tastatur3d/ziffernfeld/$*.png /tmp/$*_tmp.png
	convert +append tastatur3d/hauptfeld/$*.png /tmp/$*_tmp.png $@
	rm /tmp/$*_tmp.png
	optipng $@

%.pdf: %.svg
	inkscape --without-gui --export-pdf=$@ $<

../www/%.png: ../www/%.svg
	inkscape --without-gui --export-png=$@ $<
	optipng $@

%.png: %.svg
	inkscape --without-gui --export-png=$@ -w1000 $<
	optipng $@

FLATPNGS:=$(patsubst %.svg,%.png,$(wildcard flat/tastatur_e*.svg))

$(FLATPNGS): flat/tastatur.css flat/tastatur_base.svg
$(FLATPNGS): %.png: %.svg
	sed -e "/^@import url('tastatur.css');$$/{r flat/tastatur.css" -e 'd;}' "$<" > "$<.imported.svg"
	inkscape --without-gui --export-png="$@" "$<.imported.svg"
	optipng "$@"
	rm "$<.imported.svg"


.PHONY: default clean \
	pdf cleanpdf \
	png cleanpng \
	ebenen cleanebenen \
	svg cleansvg
