all:  #index.html index.docx index.txt

#index.html: index.md style.css
	#@sass sass/abridge.scss abridge.css
	#pandoc --standalone -c abridge.css --from markdown --to html -o index.html index.md

#index.pdf: index.html
#	wkhtmltopdf index.html index.pdf

#index.docx: index.md
	#pandoc --from markdown --to docx -o index.docx index.md

#index.txt: index.md
	#pandoc -f markdown+smart -t markdown-smart --from markdown --to plain -o index.txt index.md

test:
	@echo echo

index:
	@cat src/head.md src/CV-Luis-TI.md 1> target/index.md
	@cat src/head.es.md src/CV-Luis-TI.es.md 1> target/index.es.md
	@cat src/head.pt.md src/CV-Luis-TI.pt.md 1> target/index.pt.md

clean:
	rm -f target/*
