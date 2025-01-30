# Use an official PHP image with Apache
FROM php:7.4-apache

# Set a secure working directory
WORKDIR /var/www/html

# Install necessary PHP extensions and enable Apache modules
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && rm -rf /var/lib/apt/lists/*

# Copy only necessary files first for better caching
COPY . /var/www/html/

# Set proper permissions to avoid permission issues
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Enable Apache mod_rewrite for better URL handling
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]
