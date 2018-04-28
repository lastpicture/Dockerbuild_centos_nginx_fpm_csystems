FROM centos:7

ENV container docker

#Tools install
RUN yum -y install wget tar
RUN yum -y install epel-release

RUN groupadd nginx -g 1002
RUN useradd nginx -g 1002 -u 1002

#nignx install
RUN yum -y install nginx

#php setup
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


RUN yum -y install php71w-fpm php71w-intl php71w-opcache php71w-common php71w-cli php71w-bcmath php71w-gd php71w-mcrypt php71w-mysql php71w-pdo php71w-pgsql php71w-phpdbg php71w-pecl-imagick php71w-xml php71w-imap php71w-snmp php71w-mbstring
COPY nginx.conf /etc/nginx/
COPY www.conf /etc/php-fpm.d/
COPY php-fpm.conf /etc/
COPY opcache.ini /etc/php.d/
COPY test.php /usr/share/nginx/html/
RUN yum -y install composer --skip-broken
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 80


CMD ["start.sh"]
