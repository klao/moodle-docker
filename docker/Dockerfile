FROM php:7.4-apache
RUN apt-get update -q \
    && apt-get install -y -q --no-install-recommends less lsof net-tools iputils-ping netcat \
        neovim sudo git cron libzip-dev zip unzip p7zip-full libpng-dev libjpeg-dev libwebp-dev \
        libpq-dev libicu-dev libxml2-dev
#        && apt-get clean \
#        && rm -rf /var/lib/apt/lists/*

# User and group setup
RUN addgroup --gid 1000 moodle \
    && adduser --uid 1000 --gid 1000 --disabled-password --gecos "Moodle User" moodle \
    && adduser moodle sudo

# Apache setup
RUN a2enmod rewrite

# Add composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# PHP extensions
RUN docker-php-ext-install intl pgsql zip opcache soap xmlrpc
RUN docker-php-ext-configure gd --with-webp --with-jpeg
RUN docker-php-ext-install gd

# PHP config
RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini
RUN echo max_input_vars=10000 >> $PHP_INI_DIR/conf.d/input-vars.ini
COPY opcache.ini $PHP_INI_DIR/conf.d/opcache.ini

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

# Copy install script
COPY --chown=moodle:moodle install-moodle.sh /usr/local/bin/install-moodle.sh
