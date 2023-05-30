FROM ubuntu:latest

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y sudo acl vim bc

# Set the working directory to /home
WORKDIR /home/bash

# Copy the bash directory (containing all the scripts) to /home directory inside the container
COPY bash /home/bash

# Make all the scripts executable
RUN chmod +x /home/bash/*.sh

CMD tail -f /dev/null

# Set the default command to run the genStudent.sh script

EXPOSE 80 8080
