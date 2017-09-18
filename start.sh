#!/bin/bash
mkdir /tmp/session
mkdir /tmp/wsdlcache
chown 1002:1002 /tmp/session
chown 1002:1002 /tmp/wsdlcache
chmod 600 /tmp/session
chmod 600 /tmp/wsdlcache

nginx
php-fpm -F
