FROM nlcgi/restx
RUN apt-get install -y git-core
RUN mkdir ~/fromgit
WORKDIR ~/fromgit
RUN git clone https://github.com/okke/mysecond-restx-example.git
WORKDIR mysecond-restx-example
RUN restx deps install

EXPOSE 8080

ADD startup.sh /tmp/
RUN chmod +x /tmp/startup.sh

ENTRYPOINT exec /tmp/startup.sh

