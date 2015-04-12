FROM nlcgi/nodedev

EXPOSE 8080
EXPOSE 35729

RUN npm install -g gulp 
RUN npm install -g bower 
RUN npm install -g yo
RUN npm install -g generator-bespoke

# Add a yeoman user because grunt doesn't like being root
#
RUN adduser --disabled-password --gecos "" yeoman;
RUN echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
ENV HOME /home/yeoman
USER yeoman
WORKDIR /home/yeoman

RUN sudo npm link gulp
RUN sudo npm link bower
RUN sudo npm link yo
RUN sudo npm link generator-bespoke
