# DOCKER-VERSION	1.3.2

FROM ubuntu:14.04
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

ENV JMETER_VERSION 2.12
ENV JAVA_DIR /usr/java
ENV JMETER_ARCHIVE http://mirror.cogentco.com/pub/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

RUN apt-get update && \
  apt-get install -y openjdk-7-jre wget && \
  mkdir ${JAVA_DIR} && \
  ln -s /usr/lib/jvm/java-7-openjdk-amd64 ${JAVA_DIR}/default && \
  wget -q -O - ${JMETER_ARCHIVE} | tar xz && \
  rm -rf /var/lib/apt/lists/*

EXPOSE 4445