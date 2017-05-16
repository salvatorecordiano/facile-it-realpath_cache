#!/bin/bash
if [ $# -lt 1 ]
then
	echo "Usage: $0 <configuration name>"
	echo "Configuration allowed: production, production-no-opcache, production-no-realpath-cache"
	exit
fi

case "$1" in

production|production-no-opcache|production-no-realpath-cache)  
	echo "Using <$1> configuration"
	docker run -it --rm --name php_cache_demo \
	-v $(pwd)/configs/$1.ini:/usr/local/etc/php/conf.d/custom.ini \
	-p 80:80 \
	salvatorecordiano/php-realpath_cache-demo:latest
	;;
*) 
	echo "Usage: $0 <configuration name>"
	echo "Configuration allowed: production, production-no-opcache, production-no-realpath-cache"
	;;
esac
