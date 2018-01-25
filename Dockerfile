FROM ubuntu:latest

# install core packages
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/vim
RUN apt update && apt install -y sudo curl zsh git vim tmux

# setup default user
RUN useradd -m editor
RUN echo "editor:editor" | chpasswd
RUN adduser editor sudo
USER editor
WORKDIR /home/editor

# install config files
RUN git clone http://github.com/wbbutterworth/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/bin/install

# start zsh
CMD /bin/zsh
