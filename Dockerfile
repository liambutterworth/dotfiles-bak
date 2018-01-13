FROM ubuntu:latest

RUN apt update \
	&& apt install -y software-properties-common \
	&& add-apt-repository ppa:jonathonf/vim \
	&& apt update \
	&& apt install -y sudo curl zsh git vim tmux nodejs

# setup admin user as default
RUN useradd -m admin && adduser admin sudo && echo "admin:admin" | chpasswd
USER admin
WORKDIR /home/admin

# install and initialize dev environment
RUN git clone http://github.com/wbbutterworth/dotfiles.git && cd dotfiles && bin/install
ENV LANG en_US.UTF-8
CMD /bin/zsh
