SHELL := /bin/bash 

.PHONY: book

docker: docker_book docker_tinytex

docker_book: docker_book_build docker_book_push

docker_tinytex: docker_tinytex_build docker_tinytex_push

book: build_book package_book package_data

docker_book_build:
	cd docker/book;\
	docker build --pull --no-cache -t registry.gitlab.com/claut/man_ccia/book .

docker_book_push:
	docker push registry.gitlab.com/claut/man_ccia/book

docker_tinytex_build:
	cd docker/tinytex;\
	docker build --pull --no-cache -t registry.gitlab.com/claut/man_ccia/tinytex .

docker_tinytex_push:
	docker push registry.gitlab.com/claut/man_ccia/tinytex

fontawesome:
	mkdir fontawesome;\
	wget "https://use.fontawesome.com/releases/v${FAVER}/fontawesome-free-${FAVER}-web.zip";\
	unzip -j "fontawesome-free-${FAVER}-web.zip" "fontawesome-free-${FAVER}-web/css/*" -d fontawesome/css;\
	unzip -j "fontawesome-free-${FAVER}-web.zip" "fontawesome-free-${FAVER}-web/webfonts/*" -d fontawesome/webfonts;\
	rm "fontawesome-free-${FAVER}-web.zip"

build_book:
	source activate man_ccia;\
	Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'

package_book:
	mv _book public

package_data:
	mkdir -p public/data;\
	cp -r data/* public/data/;\
	cd public/data;\
	curl https://gitlab.com/claut/man_ccia/snippets/1965702/raw | sh

clean:
	chown -R 1000:1000 .;\
        git clean -fdx
