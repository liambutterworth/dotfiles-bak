FROM ubuntu:latest

# install core packages and create admin user
RUN apt update \
	&& apt install -y software-properties-common \
	&& add-apt-repository ppa:jonathonf/vim \
	&& apt update \
	&& apt install -y sudo curl zsh git vim tmux nodejs \
	&& useradd -m admin \
	&& echo "admin:admin" | chpasswd \
	&& adduser admin sudo \
	&& chsh -s /bin/zsh admin

USER admin
WORKDIR /home/admin

# setup development environment
RUN git clone http://github.com/wbbutterworth/dotfiles.git \
	&& cd ~/dotfiles \
	&& ./install.sh
 
CMD ["/bin/zsh"]
