# Inside the Ubuntu container:
docker exec -it ubuntu-container /bin/bash


# 1. Run a Docker container with the hostname "hamzahashmi" and an Ubuntu image
docker run -it --hostname hamzahashmi --name ubuntu-container -v /var/run/docker.sock:/var/run/docker.sock ubuntu

# 2. set root user passward
sudo passwd root

# 3. Update package lists
apt-get update

# 4. Install sudo
apt-get install -y sudo

# 5. Install adduser
apt-get install -y adduser

# 6. Create a new user "hamzahashmi" and set up a home directory
adduser hamzahashmi

# 7. Add "hamzahashmi" to the sudo group
usermod -aG sudo hamzahashmi

# 8. Switch to the new user "hamzahashmi"
su - hamzahashmi

# As the new user, inside the Ubuntu container:

# 9. Update the package lists again (as the new user)
apt-get update

# 10. goto root user
exit

# 11. Install Docker inside the containerized Ubuntu
•	sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

•	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –


•	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

•	sudo apt-get update


•	sudo apt-get install -y docker-ce

# 12. Verify Docker installation
docker –version


# 13.  Run a Docker Container Inside the Container (if needed)
docker run -it --hostname DinD --name DinD ubuntu /bin/bash

# -------------------------------------------------

# A. Create a new network
docker network create mongo-network 

# B. run a mongodb container as a new server
docker run -p 27017:27017 -d -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo

# C. create a mongo-express container to vusialize the mongoDb database
docker run --network mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password -p 8081:8081 mongo-express

