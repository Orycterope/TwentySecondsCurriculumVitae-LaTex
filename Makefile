# Makefile twentyseconds cv

files_tex = $(wildcard *.tex)
cv_name = "cv_thomas_vermeilh"
all: pdf
	echo "Done!"

pdf: $(cv_name).pdf
$(cv_name).pdf: *.tex
	echo "Building.... $^"
	$(foreach var,$(files_tex),pdflatex -interaction=nonstopmode -jobname=$(cv_name) '$(var)' ;)

jpg: $(cv_name).jpg
$(cv_name).jpg: $(cv_name).pdf
	convert -density 400 $(cv_name).pdf[0] -quality 90 $(cv_name).jpg

png: $(cv_name).png
$(cv_name).png: $(cv_name).pdf
	convert -background white -alpha background -alpha off -density 400 $(cv_name).pdf[0] -quality 100 $(cv_name).png

clean:
	rm -f *.aux *.dvi *.log *.out *.pdf *.bak $(cv_name)*.jpg $(cv_name)*.png
	echo "Clean done.";
