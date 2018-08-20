SHELL := /bin/bash 

.PHONY: book

docker: docker_book docker_tinytex

docker_book: docker_book_build docker_book_push

docker_tinytex: docker_tinytex_build docker_tinytex_push

book: build_book package_book

docker_book_build:
	cd docker/book;\
	docker build --pull -t registry.gitlab.com/claut/man_ccia/book .

docker_book_push:
	docker push registry.gitlab.com/claut/man_ccia/book

docker_tinytex_build:
	cd docker/tinytex;\
	docker build --pull -t registry.gitlab.com/claut/man_ccia/tinytex .

docker_tinytex_push:
	docker push registry.gitlab.com/claut/man_ccia/tinytex

patches:
	apt-get update;\
	apt-get install -y --no-install-recommends libgfortran-6-dev;\
	ln -s /usr/lib/gcc/x86_64-linux-gnu/6/libgfortran.so /usr/lib/x86_64-linux-gnu/libgfortran.so.4

build_book:
	source activate man_ccia;\
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

package_book:
	mv _book public

clean:
	chown -R 1000:1000 .;\
        git clean -fdx
