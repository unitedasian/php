FROM php:7.0

RUN apt-get update && apt-get install -y \
        git \
        graphviz \
        libicu-dev \
        libldap2-dev \
        libmcrypt-dev \
        openssh-client \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure ldap --with-libdir=/lib/x86_64-linux-gnu/ \
    && docker-php-ext-install \
        intl \
        ldap\
        mcrypt \
        pdo_mysql \
        zip

COPY conf.d/*.ini /usr/local/etc/php/conf.d/

ONBUILD COPY . /var/www

WORKDIR /var/www
