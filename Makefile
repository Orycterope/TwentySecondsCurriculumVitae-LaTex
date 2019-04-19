# Makefile twentyseconds cv

files_tex = $(wildcard *.tex)
cv_name = "Twenty-Seconds_cv"
all: pdf
	echo "Done!"
pdf: *.tex
	echo "Building.... $^"
	$(foreach var,$(files_tex),pdflatex -interaction=nonstopmode -jobname=$(cv_name) '$(var)' ;)

jpg: pdf
	convert -density 400 $(cv_name).pdf -quality 90 $(cv_name).jpg

clean:
	rm -f *.aux *.dvi *.log *.out *.pdf *.bak $(cv_name).jpg
	echo "Clean done.";
