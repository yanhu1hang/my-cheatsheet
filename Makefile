all: kindle

html: README.htm
kindle: my-cheatsheet.mobi

README.htm: README.md
	markdown.pl $< > $@

README.mobi: README.htm
	html2mobi $< --mobifile $@

my-cheatsheet.mobi: README.mobi
	cp $< $@

clean:
	rm README.htm README.mobi my-cheatsheet.mobi
