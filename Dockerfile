FROM php:7.0.13-fpm-alpine

Maintainer Michiel De Wilde <mich.dewild@gmail.com>

RUN apk --no-cache add wget \ 
    curl \
    git \ 
    && docker-php-ext-install curl \
    && docker-php-ext-install openssl \
    && docker-php-ext-install iconv \
    && docker-php-ext-install json \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install phar \
    && docker-php-ext-install dom

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 

RUN mkdir -p /var/www

WORKDIR /var/www

COPY . /var/www

VOLUME /var/www

CMD ["/bin/sh"]

ENTRYPOINT ["/bin/sh", "-c"]
