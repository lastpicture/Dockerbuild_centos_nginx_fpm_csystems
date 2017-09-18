FROM centos:7

#Tools install
RUN yum -y install wget tar
RUN yum -y install epel-release

#nignx install
#RUN yum install nignx

#php setup
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm


