# Docker image `neojp/php-fpm`
PHP FPM container for developing purposes. Includes additional PHP & MySQL extensions.

Based on the official PHP-FPM container from Docker's Hub:
https://hub.docker.com/_/php

**Disclaimer:** This is not a production-ready container. There are settings enabled for debugging purposes that should not ever be set in production.

## Docker Hub

https://hub.docker.com/repository/docker/neojp/php-fpm/general

## Additional Ubuntu packages
- less
- mariadb-client
- zip / unzip

## Additional PHP extensions
- mysqli
- pdo
- pdo_mysql
- opcache
- gd
- gmagick-beta
- gmagick
- exif
- redis
- xdebug
- zip

## Additional CLI tools
- Composer
- WP CLI

## Additional php.ini settings

- Custom php.ini with increased post_max_size & upload_max_filesize.
- Log and display errors on screen.
- Enabled remote xdebug, and additional display stack on `var_dump`.

## Building Dockerfile

```
docker buildx build -t neojp/php-fpm:latest .
```

Or with a custom tag version and dockerfile

```
docker buildx build -t neojp/php-fpm:8.2.30-fpm -f ./8.2.30-fpm.dockerfile .
```
