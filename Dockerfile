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
    yum install -y "wget" && \
    yum install -y "unzip" && \
    yum install -y "mv" && \
    yum clean all  && \
	cd /usr && \
	wget https://downloads.typesafe.com/play/1.2.7.2/play-1.2.7.2.zip \
	unzip play-1.2.7.2.zip \
	mv  play-1.2.7.2 play 

COPY profile.d/java.sh /etc/profile.d/
COPY profile.d/custom.sh /etc/profile.d/
COPY profile.d/play.sh /etc/profile.d/
COPY profile.d/Plarx.sh /etc/profile.d/

CMD /bin/bash
