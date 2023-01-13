FROM alpine

ARG PHP_VERSION=81
ARG PECL_GRPC_VERSION=1.50.0

RUN apk upgrade --update-cache --available \
    && apk update \
    && apk add --virtual .build-deps autoconf zlib-dev php$PHP_VERSION-dev php$PHP_VERSION-pear php$PHP_VERSION-openssl g++ gcc make \
    && apk add --virtual .persistent-deps linux-headers zlib grpc \
    && pecl install grpc-$PECL_GRPC_VERSION \
    && apk del -f .build-deps \
    && rm -r /var/cache/*

