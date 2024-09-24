build the Dockerfile

docker build -t ubuntu-kubernrtes .


run the docker image "ubuntu-kubernrtes"

docker run -it --name ubuntu-docker --hostname hashmi-host ubuntu-kubernrtes
