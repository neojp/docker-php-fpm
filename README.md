# Docker image `neojp/php-fpm`
PHP FPM container for developing purposes. Includes additional PHP & MySQL extensions.

https://hub.docker.com/repository/docker/neojp/php-fpm/general

## Additional bash utils
- less
- mariadb-client
- zip / unzip
- composer
- wp-cli

## PHP Modules
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

## Building Dockerfile

```
docker buildx build -t neojp/php-fpm:latest .
```

Or with a custom tag version and dockerfile

```
docker buildx build -t neojp/php-fpm:8.2.30-fpm -f ./8.2.30-fpm.dockerfile .
```
