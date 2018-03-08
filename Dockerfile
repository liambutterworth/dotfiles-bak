FROM ubuntu:latest

# install core packages
RUN apt update && apt install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/vim
RUN apt update && apt install -y sudo curl zsh git vim tmux

# install node
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN apt install -y nodejs
RUN npm install npm -g

# setup default user
RUN useradd -m user
RUN adduser user sudo
RUN echo "user:user" | chpasswd
USER user
WORKDIR /home/user

# install config files
RUN git clone http://github.com/wbbutterworth/dotfiles.git ~/.dotfiles
RUN ~/.dotfiles/bin/install

# start zsh
CMD /bin/zsh
