SHELL := /bin/bash 

.PHONY: book

docker: docker_build docker_push

book: build_book package_book

conda: conda_build conda_convert

docker_build:
	cd docker;\
	docker build -t registry.gitlab.com/conoria/man_ccia .

docker_push:
	docker push registry.gitlab.com/conoria/man_ccia

build_book:
	source activate book;\
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

package_book:
	mv _book public

conda_build:
	misc/conda.sh build

conda_convert:
	misc/conda.sh convert
