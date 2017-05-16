.PHONY: build build-no-cache push

build:
	docker build Docker -t salvatorecordiano/realpath_cache:latest

build-no-cache:
	docker build Docker -t salvatorecordiano/realpath_cache:latest --no-cache

push:
	docker push salvatorecordiano/realpath_cache:latest
