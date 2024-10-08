# Use the latest Ubuntu image
FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && apt-get install -y \
    sudo \
    nodejs \
    npm \
    git \
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

# Add 'hamzahashmi' user to the docker group
RUN usermod -aG docker hamzahashmi

# Switch to 'hamzahashmi' user
USER hamzahashmi

# Set the default working directory
WORKDIR /home/hamzahashmi

# Create directories for projects
RUN mkdir kunal-devops tech-with-nana

# Install kubectl and minikube in kunal-devops
WORKDIR /home/hamzahashmi/kunal-devops

# Switch to root user temporarily to move kubectl to /usr/local/bin/
USER root

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install Minikube
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
    chmod +x minikube-linux-amd64 && \
    mv minikube-linux-amd64 /usr/local/bin/minikube

# Switch back to 'hamzahashmi' user
USER hamzahashmi

# Return to default working directory
WORKDIR /home/hamzahashmi

# Set the default command
CMD ["/bin/bash"]
