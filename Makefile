all: kindle

html: README.htm
kindle: my-cheatsheet.txt

README.htm: README.md
	markdown.pl $< > $@

my-cheatsheet.txt: README.md
	cp $< $@

clean:
	rm README.htm my-cheatsheet.txt
