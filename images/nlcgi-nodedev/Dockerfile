FROM nlcgi/base

RUN apt-get install -y git-core
RUN apt-get install -y vim
RUN apt-get install -y nodejs
RUN apt-get install -y npm

#
# hack because ubuntu/debian based node
# has renamed the node executable to nodejs
#
RUN  ln -s /usr/bin/nodejs /usr/bin/node

# Setup home environment
#
RUN useradd dev
RUN mkdir /home/dev
RUN chown -R dev:dev /home/dev
RUN mkdir -p /home/dev/bin
ENV PATH /home/dev/bin:$PATH
WORKDIR /home/dev
ENV HOME /home/dev

# configure vim
#
# -1 install pathogen (see https://github.com/tpope/vim-pathogen)
#
RUN mkdir -p /home/dev/.vim/autoload /home/dev/.vim/bundle
RUN mkdir -p /home/.vim/colors
RUN curl -LSso /home/dev/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#
# -3 add pre-configured .vimrc and remove ^M's 
#
COPY vimrc /home/dev/.vimrc
COPY candy.vim /home/dev/.vim/colors/candy.vim

#
# dos2unix vimrc
#
RUN tr -d '\r' < .vimrc > .tmp
RUN mv -f .tmp .vimrc

RUN tr -d '\r' < /home/dev/.vim/colors/candy.vim > .tmp
RUN mv -f .tmp /home/dev/.vim/colors/candy.vim

