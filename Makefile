.PHONY: build push

build:
	docker build Docker -t salvatorecordiano/php-realpath_cache-demo:latest --no-cache

push:
	docker push salvatorecordiano/php-realpath_cache-demo:latest
