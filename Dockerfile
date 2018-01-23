FROM ubuntu:latest

# install core packages
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/vim
RUN apt update
RUN apt install -y sudo curl zsh git vim tmux

# setup admin user as default
RUN useradd -m admin && adduser admin sudo && echo "admin:admin" | chpasswd
USER admin
WORKDIR /home/admin

# install and initialize dev environment
RUN git clone http://github.com/wbbutterworth/dotfiles.git ~/.dotfiles && ~/.dotfiles/bin/install
ENV LANG en_US.UTF-8
CMD /bin/zsh
