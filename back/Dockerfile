FROM php:7.4-fpm as base
RUN useradd -ms /bin/bash php-user
USER php-user
WORKDIR /var/www
# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


from base as dev

# Set working directory
WORKDIR /var/www

COPY --chmod=755 ./entrypoint.sh /usr/local/bin/entrypoint.sh

from base as prod

USER php-user
# Set working directory
WORKDIR /var/www
COPY --chmod=755 ./entrypoint.sh /usr/local/bin/entrypoint.sh
COPY . .
RUN composer install