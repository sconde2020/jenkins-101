FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && apt-get install -y lsb-release

RUN apt-get update && apt-get install -y \

    software-properties-common

#RUN add-apt-repository universe

RUN apt-get update && apt-get install -y \

    python3.6 \

    python3-pip

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \

  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \

  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \

  https://download.docker.com/linux/debian \

  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean:1.27.7 docker-workflow:563.vd5d2e5c4007f"

