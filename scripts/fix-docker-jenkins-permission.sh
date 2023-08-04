#!/bin/sh

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
JENKINS_USER=jenkins

if [ -S ${DOCKER_SOCKET} ]; then
    DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
    sudo groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}
    sudo usermod -aG ${DOCKER_GROUP} ${JENKINS_USER}
fi
