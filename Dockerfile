ARG BASE_IMAGE ubuntu:18.04
FROM ${BASE_IMAGE}
ARG DEBIAN_FRONTEND=noninteractive 
ARG PHP_VERSION 7.3
ARG php_ver=${PHP_VERSION:-""}

RUN apt-get update \
  && apt-get install software-properties-common -y \
  && add-apt-repository ppa:ondrej/php \
  && apt-get update \
  && apt-get install apache2 php${php_ver} \
    php${php_ver}-common \
    php-json \
    php${php_ver}-gd \
    php${php_ver}-cli \
    php${php_ver}-mbstring \
    php${php_ver}-xml \
    php${php_ver}-opcache \
    php${php_ver}-mysql -y \
  && . /etc/apache2/envvars \
  && rm -rf /var/lib/apt/lists/* && apt-get clean \
  && ln -sf /proc/self/fd/1 /var/log/apache2/access.log \
  && ln -sf /proc/self/fd/2 /var/log/apache2/error.log

RUN set -eux \
  && apt-get update \
  && apt-get install vim -y \
  && rm -rf /var/lib/apt/lists/* && apt-get clean \
  && echo \
"set fileencodings=ucs-bom,utf-8,big5,gb18030,euc-jp,euc-kr,latin1 \n\
set fileencoding=utf-8 \n\
set encoding=utf-8" >> /etc/vim/vimrc

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
