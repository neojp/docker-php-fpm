FROM php:7.3.6-fpm

LABEL maintainer="Joan Piedra <joan@joanpiedra.com>"

# update
RUN apt-get update -y

# install less
RUN apt-get install -y less

# install mariadb-client
RUN apt-get install -y mariadb-client

# install zip utils
RUN apt-get install -y zlib1g-dev zip unzip

# install mysqli
RUN docker-php-ext-install mysqli

# install pdo & pdo_mysql
RUN docker-php-ext-install pdo && docker-php-ext-install pdo_mysql

# install opcache
RUN docker-php-ext-install opcache

# install PHP GD
RUN apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev zlib1g-dev libzip-dev
RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir --enable-gd-native-ttf
RUN docker-php-ext-install gd

# install graphicsmagick
RUN apt-get install -y graphicsmagick graphicsmagick-imagemagick-compat libgraphicsmagick1-dev
RUN pecl install gmagick-beta && docker-php-ext-enable gmagick

# install exif
RUN docker-php-ext-install exif

# install phpredis
RUN pecl install redis-4.3.0 && docker-php-ext-enable redis

# install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# php zip
RUN docker-php-ext-install zip && docker-php-ext-enable zip

# install composer
RUN curl -o composer-setup.php https://getcomposer.org/installer \
	&& php composer-setup.php \
	&& rm composer-setup.php \
	&& mv composer.phar /usr/local/bin/composer

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# add alias for wp-cli
RUN touch /root/.bashrc
RUN echo "" >> /root/.bashrc
RUN echo "alias wp='wp --allow-root'" >> /root/.bashrc

# php.ini
COPY php.ini /usr/local/etc/php/php.ini
