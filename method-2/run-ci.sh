#!/bin/sh

CONTAINER_NAME="$1"




docker run -d -it \
    -u root \
    -v /home/core/jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 8888:8080 \
    -p 50000:50000 \
    --name ${1:-jenkins} \
    ndslabs/jenkins

