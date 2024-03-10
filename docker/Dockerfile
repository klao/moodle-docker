FROM php:8.0-apache
RUN apt-get update -q \
    && apt-get install -y -q --no-install-recommends less lsof net-tools iputils-ping netcat-traditional \
        neovim sudo git cron bash-completion rsync nano \
        libzip-dev zip unzip p7zip-full libpng-dev libjpeg-dev libwebp-dev libpq-dev libicu-dev \
        libxml2-dev libyaml-dev
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

# Add moosh
RUN curl -sSL https://moodle.org/plugins/download.php/29895/moosh_moodle42_2023090700.zip -o /tmp/moosh.zip \
    && unzip -q /tmp/moosh.zip -d /opt \
    && rm /tmp/moosh.zip \
    && ln -s /opt/moosh/moosh.php /usr/local/bin/moosh \
    && cp /opt/moosh/bash_completion /etc/bash_completion.d/moosh

# PHP extensions
RUN docker-php-ext-install intl pgsql zip opcache soap exif
RUN docker-php-ext-configure gd --with-webp --with-jpeg
RUN docker-php-ext-install gd
RUN pecl install yaml && docker-php-ext-enable yaml
RUN pecl install channel://pecl.php.net/xmlrpc-1.0.0RC3 && docker-php-ext-enable xmlrpc

# PHP config
RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini
RUN echo max_input_vars=10000 >> $PHP_INI_DIR/conf.d/input-vars.ini
RUN echo upload_max_filesize=200M >> $PHP_INI_DIR/conf.d/max-size.ini
RUN echo post_max_size=200M >> $PHP_INI_DIR/conf.d/max-size.ini
COPY opcache.ini $PHP_INI_DIR/conf.d/opcache.ini

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

COPY sudoers.d/moodle-cron /etc/sudoers.d/

# Copy install script
COPY --chown=moodle:moodle install-moodle*.sh /usr/local/bin/

# Startup setup
COPY docker-start.sh /usr/local/bin/
CMD ["/usr/local/bin/docker-start.sh"]
ENTRYPOINT []
