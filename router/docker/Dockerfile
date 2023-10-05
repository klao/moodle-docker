FROM traefik:latest

RUN apk update && apk add unzip
RUN mkdir /opt/certs && cd /opt/certs \
    && wget https://aka.re/localhost -O localhost.zip \
    && unzip -P localhost localhost.zip
