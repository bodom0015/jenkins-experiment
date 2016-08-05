FROM jenkins:1.651.3-alpine

USER root


#RUN apt-get update \
#      && apt-get install -y docker.io \
#      && rm -rf /var/lib/apt/lists/*
#RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers && \
#    usermod -aG docker $(whoami)

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
