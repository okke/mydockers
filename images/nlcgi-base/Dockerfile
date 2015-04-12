FROM ubuntu

ENV http_proxy http://proxy.nl.logica.com:80
ENV https_proxy http://proxy.nl.logica.com:80
ENV no_proxy=localhost,127.0.0.1

RUN apt-get update -y

RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y curl
