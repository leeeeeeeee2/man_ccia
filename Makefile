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
	echo "No patches needed"

build_book:
	source activate man_ccia;\
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

package_book:
	mv _book public

clean:
	chown -R 1000:1000 .;\
        git clean -fdx

local_container:
	docker run --rm -it -v $PWD:/src registry.gitlab.com/claut/man_ccia bash
