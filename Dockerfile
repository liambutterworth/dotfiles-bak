FROM ubuntu:latest

# install core packages; reference vim 8 repository
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/vim
RUN apt update && apt install -y sudo curl zsh git vim tmux

# setup admin user as default; give admin user sudo priveliges without password
RUN useradd -m admin && echo "admin:admin" | chpasswd && adduser admin sudo
RUN echo "admin ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/admin && chmod 0440 /etc/sudoers.d/admin
USER admin
WORKDIR /home/admin

# install and initialize dev environment
RUN git clone http://github.com/wbbutterworth/dotfiles.git ~/.dotfiles && ~/.dotfiles/bin/install
