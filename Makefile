SHELL := /bin/bash 

.PHONY: book

docker: docker_build docker_push

book: build_book package_book

docker_build:
	cd docker;\
	docker build -t registry.gitlab.com/claut/man_ccia .

docker_push:
	docker push registry.gitlab.com/claut/man_ccia

build_book:
	source activate man_ccia;\
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

package_book:
	mv _book public
