#!/bin/bash

# Run using:
#
# ./generate_docs.sh
#
# This shell script is based on the convert.sh of Arun Gupta in his repository for javaee7-hol

# Program paths
ASCIIDOCTOR=asciidoctor
ASCIIDOCTOR_PDF=asciidoctor-pdf

# File names
MASTER_ADOC=readme.adoc
MASTER_DOCBOOK=${MASTER_ADOC/.adoc/.xml}

# Command options
SHARED_OPTIONS='-a numbered -a experimental -a source-highlighter=coderay -a imagesdir=images'

echo "Converting to HTML ..."
$ASCIIDOCTOR -v $SHARED_OPTIONS $MASTER_ADOC

echo "and now converting to DocBook ..."
$ASCIIDOCTOR -b docbook $SHARED_OPTIONS $MASTER_ADOC

echo "and finally generate a PDF document ..."
$ASCIIDOCTOR_PDF $SHARED_OPTIONS $MASTER_ADOC

exit 0
