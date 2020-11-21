FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
		vim-tiny unzip procps sudo wget \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmemcached-dev \
		libcurl4-gnutls-dev \
		libc-client-dev libkrb5-dev \
		libldap2-dev \
		libxml2-dev \
		libbz2-dev \
		libzip-dev \
		zlib1g-dev libicu-dev g++ \
		gnupg \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install -j$(nproc) gettext \
	&& docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
	&& docker-php-ext-install -j$(nproc) imap \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install -j$(nproc) intl \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
	&& docker-php-ext-install -j$(nproc) ldap \
	&& docker-php-ext-install -j$(nproc) mysqli \
	&& docker-php-ext-install -j$(nproc) opcache \
	&& docker-php-ext-install -j$(nproc) pdo_mysql \
	&& docker-php-ext-install -j$(nproc) xmlrpc \
	&& docker-php-ext-install -j$(nproc) sockets \
	&& docker-php-ext-install -j$(nproc) bz2 \
	&& docker-php-ext-install -j$(nproc) zip \
	&& docker-php-ext-install -j$(nproc) sockets \
	&& pecl install memcached \
	&& apt-get clean all && rm -rf /var/lib/apt/lists/

COPY ./composer-install.sh /usr/local/bin/composer-install.sh
RUN /usr/local/bin/composer-install.sh
RUN composer global require hirak/prestissimo

WORKDIR /var/www/html
