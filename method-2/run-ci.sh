#!/bin/sh

CONTAINER_NAME="$1"




docker run -d -it \
    -u root \
    --privileged \
    -v /var/jenkins_home:/var/jenkins_home \
    -p 8888:8080 \
    -p 50000:50000 \
    --name ${1:-jenkins} \
    ndslabs/jenkins:dind

