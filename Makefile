.PHONY: test

SHELL = /bin/bash

cv:
	./create_pdf.sh --file=main-cv.tex

cover-letter:
	./create_pdf.sh --file=main-cover-letter.tex

clean-aux:
	./create_pdf.sh --clean --file=main-cv.tex
	./create_pdf.sh --clean --file=main-cover-letter.tex

clean-full:
	./create_pdf.sh --full-clean --file=main-cv.tex
	./create_pdf.sh --full-clean --file=main-cover-letter.tex

ci-info:
	@date; echo; pwd; echo; ls -la; echo
