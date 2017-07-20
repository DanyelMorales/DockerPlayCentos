From centos:6.6
MAINTAINER Daniel Vera Morales (http://danyelmorales.github.io)

ARG JAVA_VERSION=7
ARG JAVA_RELEASE=JDK

ENV JAVA_HOME=/usr

RUN pkg="java-1.$JAVA_VERSION.0-openjdk"; \
    if [ "$JAVA_RELEASE" = "JDK" ]; then \
        pkg="$pkg-devel"; \
    else \
        pkg="$pkg-headless"; \
    fi; \
    yum install -y "$pkg" && \
    yum clean all

COPY profile.d/java.sh /etc/profile.d/
COPY profile.d/custom.sh /etc/profile.d/
COPY programs/play127/**/*  /usr/play/

CMD /bin/bash
