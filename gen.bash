#!/bin/bash

source env/env.bash

#asciidoctor-pdf \
#	-a pdf-theme=default-with-fallback-font \
#	-a scripts=cjk \
#	-o pdf/test.pdf docs/main.adoc
	
#-a pdf-theme=docs/settings/theme.yml \


if [ $# -ne 1 -a $# -ne 2 ]
then
	echo "Usage: $0 <filename> [html]"
	exit 1
fi


ASCIIDOC_TOOL=asciidoctor-pdf
OUTPUT=pdf/manual-${1}.pdf

if [ $# -eq 2 ]
then
	ASCIIDOC_TOOL=asciidoctor
	OUTPUT=html/manual-${1}.html
fi
docker run -it \
	-v `pwd`:/documents/ asciidoctor/docker-asciidoctor \
	${ASCIIDOC_TOOL} \
	-o ${OUTPUT} \
	${DOC_DIR}/main.adoc 

