FROM nlcgi/base

RUN apt-get install -y git-core
RUN apt-get install -y ruby-full
RUN apt-get install -y vim

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable


# Setup home environment
#
RUN useradd dev
RUN usermod -a -G rvm dev
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
# -2 install ruby support
#
RUN git clone https://github.com/vim-ruby/vim-ruby.git /home/dev/.vim/bundle/vim-ruby
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

# do some rvm thingies
#
RUN /etc/profile.d/rvm.sh
RUN /usr/local/rvm/bin/rvm install 2.1

#
# setup profile
#
COPY bashrc /home/dev/.bashrc
RUN tr -d '\r' < .bashrc > .tmp
RUN mv -f .tmp .bashrc

# and be a developer
#
USER dev

# config git
#
RUN git config --global user.name "okke"
RUN git config --global user.email oftewel@gmail.com

