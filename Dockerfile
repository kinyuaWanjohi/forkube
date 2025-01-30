# Use an official PHP image with Apache
FROM php:7.4-apache

# Set the working directory
WORKDIR /var/www/html

# Copy website files into the container
COPY . /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache when the container runs
CMD ["apache2-foreground"]
