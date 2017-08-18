clean:
	rm -rf txts pdfs *.pdf *.txt

get_pdf_urls:
	python get_pdf_urls.py > pdf_urls.txt

get_pdfs: get_pdf_urls
	mkdir pdfs
	wget -i pdf_urls.txt -P pdfs

PDF_INPUTS = $(wildcard pdfs/*.pdf)
TXT_OUTPUTS = $(patsubst pdfs/%.pdf,txts/%.txt,$(PDF_INPUTS))

txts/%.txt: pdfs/%.pdf
	mkdir -p txts
	pdftotext $< $@

pdfs_to_txt: $(TXT_OUTPUTS)
