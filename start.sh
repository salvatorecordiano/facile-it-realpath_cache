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
	-v $(pwd)/logs:/var/log/supervisord \
	-v $(pwd)/configs/$1.ini:/etc/php/7.0/fpm/conf.d/99-custom.ini \
	-p 80:80 \
	salvatorecordiano/realpath_cache:latest
	;;
*) 
	echo "Usage: $0 <configuration name>"
	echo "Configuration allowed: production, production-no-opcache, production-no-realpath-cache"
	;;
esac
