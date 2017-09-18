#!/bin/bash

cd /mnt/drive1/docker_builds/Dockerbuild_centos_nginx_fpm_csystems
git pull
docker build . -t centos:test
docker run --rm --name test -p 666:80 -v /mnt/drive1/stream/stream:/usr/share/nginx/html/ -it centos:test start.sh