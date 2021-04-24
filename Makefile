.PHONY: all clean

all: site.tar.gz

bin/ssg:
	mkdir -p bin
	curl --proto '=https' --tlsv1.2 -SLf -o bin/ssg https://rgz.ee/bin/ssg6
	chmod +x bin/ssg

dst: src bin/ssg
	mkdir -p dst
	./bin/ssg src dst 'William Culhane' 'culhane.top'

site.tar.gz: dst
	tar --exclude=.files -cvzC dst/ . > site.tar.gz

clean:
	rm -rf dst
	rm -rf bin
	rm -f site.tar.gz
