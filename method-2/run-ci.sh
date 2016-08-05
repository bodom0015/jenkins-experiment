#!/bin/sh

CONTAINER_NAME="$1"




docker run -d -it \
    -u root \
    --net=host \
    -v /home/core/jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 8080:8080 \
    -p 50000:50000 \
    --name ${1:-jenkins} \
    jenkins

