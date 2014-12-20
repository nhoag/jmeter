# DOCKER-VERSION	1.3.2

FROM ubuntu:14.04
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

ENV JMETER_VERSION 2.12
ENV JAVA_DIR /usr/java
ENV JMETER_DIR apache-jmeter-${JMETER_VERSION}
ENV JMETER_ARCHIVE ${JMETER_DIR}.tgz
ENV JMETER_URL https://archive.apache.org/dist/jmeter/binaries/${JMETER_ARCHIVE}

RUN apt-get update && \
  apt-get install -y openjdk-7-jre-headless wget && \
  mkdir ${JAVA_DIR} && \
  ln -s /usr/lib/jvm/java-7-openjdk-amd64 ${JAVA_DIR}/default && \
  wget -q ${JMETER_URL} && \
  wget -q -O - ${JMETER_URL}.md5 | md5sum -c && \
  tar -xzf ${JMETER_ARCHIVE} -C /var/lib && \
  mv /var/lib/${JMETER_DIR} /var/lib/jmeter && \
  rm -rf /var/lib/apt/lists/* ${JMETER_ARCHIVE}
