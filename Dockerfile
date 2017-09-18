FROM centos:7

#Tools install
RUN yum -y install wget tar
RUN yum -y install epel-release

#nignx install
RUN yum -y install nginx

#php setup
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


RUN yum -y install  php71w-fpm php71w-intl php71w-opcache php71w-common php71w-cli php71w-bcmath \
    php71w-gd php71w-mcrypt php71w-mysql php71w-pdo php71w-pgsql php71w-phpdbg php71w-pecl-imagick php71w-xml php71w-imap php71w-snmp

COPY nginx.conf /etc/nginx/
COPY www.conf /etc/php-fpm.d/
COPY php-fpm.conf /etc/
COPY opcache.ini /etc/php.d/
COPY test.php /usr/share/nginx/html/ 

EXPOSE 80

CMD [“php-fpm”]
