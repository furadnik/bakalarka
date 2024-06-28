#!/usr/bin/bash

cp abstract.xmpdata thesis.xmpdata
cat thesis.tex | grep '^\\def\\Keywords' | \
	sed 's/^\\def//'
cat thesis.tex | grep '^\\def\\Keywords' | \
	sed 's/^\\def//' >> thesis.xmpdata
cat abstract_text.tex | \
	sed 's/^\\def\\Abstract/\\Subject/' | \
	sed 's/\%.*//' | \
	grep '.' >> thesis.xmpdata
cat abstract_text.tex | \
	sed 's/^\\def\\Abstract/\\Subject/' | \
	sed 's/\%.*//' | \
	grep '.'
