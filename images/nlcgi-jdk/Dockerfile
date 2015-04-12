FROM nlcgi/base

RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm > /tmp/jdk-8u31-linux-x64.rpm
# COPY jdk-8u31-linux-x64.rpm /tmp/jdk-8u31-linux-x64.rpm

# need alien to install rpm's
#
RUN apt-get install -y alien

RUN alien -i -c /tmp/jdk-8u31-linux-x64.rpm
RUN rm /tmp/jdk-8u31-linux-x64.rpm

ENV JAVA_HOME /usr/java/latest
ENV _JAVA_OPTIONS -Dhttp.proxyHost=proxy.nl.logica.com\ -Dhttp.proxyPort=80

RUN apt-get install -y maven

