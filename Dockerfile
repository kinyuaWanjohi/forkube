# Use an official PHP runtime as a parent image
FROM php:7.4-cli

# Set the working directory in the container
WORKDIR /usr/src/myapp

# Copy the current directory contents into the container at /usr/src/myapp
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 80

# Run index.php when the container launches
CMD [ "php", "./index.php" ]
