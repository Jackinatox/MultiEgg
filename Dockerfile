FROM alpine:3.20.2

RUN apk update
RUN apk upgrade

COPY ./jdks /tmp/java

WORKDIR /app


RUN mkdir -p /var/java/Java-8 && \
tar -xzf /tmp/java/java-8.tar.gz -C /var/java/Java-8 --strip-components=1

RUN mkdir -p /var/java/Java-11 && \
tar -xzf /tmp/java/java-11.tar.gz -C /var/java/Java-11 --strip-components=1  

RUN mkdir -p /var/java/Java-17 && \
tar -xzf /tmp/java/java-17.tar.gz -C /var/java/Java-17 --strip-components=1

RUN mkdir -p /var/java/Java-21 && \
tar -xzf /tmp/java/java-21.tar.gz -C /var/java/Java-21 --strip-components=1 

RUN rm -R /tmp/java

COPY ./scripts . 