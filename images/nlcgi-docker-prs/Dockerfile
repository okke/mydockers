FROM nlcgi/bespoke

USER yeoman
RUN git clone https://github.com/okke/cgi-docker-workshop.git
WORKDIR cgi-docker-workshop/presentation
RUN npm install
RUN bower install

COPY startup.sh startup.sh
RUN sudo chmod a+x startup.sh

CMD ./startup.sh


