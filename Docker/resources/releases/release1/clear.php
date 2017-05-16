<?php 
print_r(realpath_cache_get());
clearstatcache(true); 
print_r(realpath_cache_get());
