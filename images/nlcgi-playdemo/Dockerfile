FROM nlcgi/jdk

RUN apt-get install -y git-core
RUN apt-get install -y unzip

# Setup home environment
#
RUN useradd dev
RUN mkdir /home/dev
RUN chown -R dev:dev /home/dev
RUN mkdir -p /home/dev/bin
ENV PATH /home/dev/bin:$PATH
WORKDIR /home/dev
ENV HOME /home/dev

RUN curl get http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2-minimal.zip > /tmp/typesafe.zip

