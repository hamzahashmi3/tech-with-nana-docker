# Use the latest Ubuntu image
FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    adduser \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Set hostname
RUN echo "hashmi-host" > /etc/hostname

# Set root password
RUN echo "root:1234" | chpasswd

# Add new user 'hamzahashmi' and set password
RUN adduser --disabled-password --gecos "" hamzahashmi && \
    echo "hamzahashmi:1234" | chpasswd && \
    echo "hamzahashmi ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Docker in the Ubuntu container
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce

# Switch to 'hamzahashmi' user
USER hamzahashmi

# Set the default working directory
WORKDIR /home/hamzahashmi

# Create directories for projects
RUN mkdir kunal-devops tech-with-nana

CMD ["/bin/bash"]
