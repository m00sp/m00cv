all: short-all #index.html index.docx index.txt

#index.html: index.md style.css
	#@sass sass/abridge.scss abridge.css
	#pandoc --standalone -c abridge.css --from markdown --to html -o index.html index.md

#index.pdf: index.html
#	wkhtmltopdf index.html index.pdf

#index.docx: index.md
	#pandoc --from markdown --to docx -o index.docx index.md

#index.txt: index.md
	#pandoc -f markdown+smart -t markdown-smart --from markdown --to plain -o index.txt index.md

short-all:
	@cat short/head.md short/luis-ti.es.md 1> short/index.md
	@cat short/head.es.md short/luis-ti.es.md 1> short/index.es.md
	@cat short/head.pt.md short/luis-ti.pt.md 1> short/index.pt.md
	echo sucesso

extended-all:
	@cat extended/head.md short/luis-ti.es.md 1> extended/index.md
	@cat extended/head.es.md short/luis-ti.es.md 1> extended/index.es.md
	@cat extended/head.pt.md short/luis-ti.pt.md 1> extended/index.pt.md
	echo sucesso

clean:
	rm -f *.html *.pdf *.docx *.txt
