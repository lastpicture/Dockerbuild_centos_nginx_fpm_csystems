#!/bin/bash
mkdir /tmp/session
mkdir /tmp/wsdlcache
chown 1002:1002 /tmp/session
chown 1002:1002 /tmp/wsdlcache
chmod 760 /tmp/session
chmod 760 /tmp/wsdlcache

nginx
php-fpm -F
